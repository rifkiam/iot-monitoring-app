import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class TurbidityProvider with ChangeNotifier {
  double _turbidity = 0.0;

  MqttServerClient? _mqttClient;

  double get turbidity => _turbidity;

  TurbidityProvider() {
    _connectToMqttBroker();
  }

  void _connectToMqttBroker() async {
    _mqttClient = MqttServerClient('broker.hivemq.com', 'your_client_id');
    final MqttConnectMessage connectMessage = MqttConnectMessage()
        .withClientIdentifier('your_client_id')
        .startClean()
        .keepAliveFor(60)
        .withWillTopic('flutter_iot_topic_turbidity')
        .withWillMessage('your_will_message')
        .withWillQos(MqttQos.atMostOnce);

    _mqttClient?.onDisconnected = _onDisconnected;
    _mqttClient?.connectionMessage = connectMessage;

    try {
      await _mqttClient?.connect();
      _mqttClient?.subscribe('flutter_iot_topic_turbidity', MqttQos.atLeastOnce);

      _mqttClient?.updates?.listen((List<MqttReceivedMessage<MqttMessage?>> event) {
        final MqttPublishMessage? message = event[0].payload as MqttPublishMessage?;
        final String payload = MqttPublishPayload.bytesToStringAsString(message!.payload.message);

        // Parse the MQTT message and update the turbidity
        final newTurbidity = double.tryParse(payload);
        if (newTurbidity != null) {
          _turbidity = newTurbidity;
          notifyListeners();
        }
      });
    } catch (e) {
      print('Error connecting to MQTT broker: $e');
    }
  }

  void _onDisconnected() {
    print('Disconnected from MQTT broker');
  }
}

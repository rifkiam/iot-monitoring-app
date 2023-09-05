import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class TemperatureProvider with ChangeNotifier {
  double _temperature = 0.0;

  MqttServerClient? _mqttClient;

  double get temperature => _temperature;

  TemperatureProvider() {
    _connectToMqttBroker();
  }

  void _connectToMqttBroker() async {
    _mqttClient = MqttServerClient('broker.hivemq.com', 'your_client_id');
    final MqttConnectMessage connectMessage = MqttConnectMessage()
        .withClientIdentifier('your_client_id')
        .startClean()
        .keepAliveFor(60)
        .withWillTopic('flutter_iot_topic_temp')
        .withWillMessage('your_will_message')
        .withWillQos(MqttQos.atMostOnce);

    _mqttClient?.onDisconnected = _onDisconnected;
    _mqttClient?.connectionMessage = connectMessage;

    try {
      await _mqttClient?.connect();
      _mqttClient?.subscribe('flutter_iot_topic_temp', MqttQos.atLeastOnce);

      _mqttClient?.updates?.listen((List<MqttReceivedMessage<MqttMessage?>> event) {
        final MqttPublishMessage? message = event[0].payload as MqttPublishMessage?;
        final String payload = MqttPublishPayload.bytesToStringAsString(message!.payload.message);

        // Parse the MQTT message and update the temperature
        final newTemperature = double.tryParse(payload);
        if (newTemperature != null) {
          _temperature = newTemperature;
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

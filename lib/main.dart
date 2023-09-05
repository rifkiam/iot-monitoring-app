import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/ph.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PHProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'MQTT Monitoring App',
        home: MonitoringPage(),
        theme: ThemeData(
          fontFamily: 'Inter'
        ),
      ),
    );
  }
}

class MonitoringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(79, 148, 255, 1),
        centerTitle: true,
        title: const Text('Water Wise', style: TextStyle(fontFamily: 'Inter', color: Colors.white, fontWeight: FontWeight.bold)),

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(color: Color.fromRGBO(164, 194, 255, 1)),
                  child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 70,
                          child: Image.asset("images/water.png", scale: 0.75),
                        ),
                        const SizedBox(width: 16,),
                        Consumer<PHProvider>(builder: (context, phProvider, child) {
                          final ph = phProvider.ph;
                          return Text("pH \n${ph.toString()}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Color.fromRGBO(43, 104, 214, 1)),);
                        })
                      ]
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(color: Color.fromRGBO(164, 194, 255, 1)),
                  child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 70,
                          child: Image.asset("images/temperature.png", scale: 0.75),
                        ),
                        const SizedBox(width: 16,),
                        Consumer<PHProvider>(builder: (context, phProvider, child) {
                          final ph = phProvider.ph;
                          return Text("Temperatur \n${ph.toString()} C", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Color.fromRGBO(43, 104, 214, 1)),);
                        })
                      ]
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(color: Color.fromRGBO(164, 194, 255, 1)),
                  child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 70,
                          child: Image.asset("images/cloud.png", scale: 0.75),
                        ),
                        const SizedBox(width: 16,),
                        Consumer<PHProvider>(builder: (context, phProvider, child) {
                          final ph = phProvider.ph;
                          return Text("Turbiditas \n${ph.toString()}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Color.fromRGBO(43, 104, 214, 1)),);
                        })
                      ]
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(color: Color.fromRGBO(164, 194, 255, 1)),
                  child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 70,
                          child: Image.asset("images/water_flow.png", scale: 0.75),
                        ),
                        const SizedBox(width: 16,),
                        Consumer<PHProvider>(builder: (context, phProvider, child) {
                          final ph = phProvider.ph;
                          return Text("Ketinggian air \n${ph.toString()}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Color.fromRGBO(43, 104, 214, 1)),);
                        })
                      ]
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(color: Color.fromRGBO(164, 194, 255, 1)),
                  child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 70,
                          child: Image.asset("images/tube.png", scale: 0.75),
                        ),
                        const SizedBox(width: 16,),
                        Consumer<PHProvider>(builder: (context, phProvider, child) {
                          final ph = phProvider.ph;
                          return Text("TDS \n${ph.toString()}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Color.fromRGBO(43, 104, 214, 1)),);
                        })
                      ]
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              // Expanded(
              //     child: Container(
              //       child: SizedBox.expand(),
              //     )
              // ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  child: Text("Indeks Kualitas Air: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color.fromRGBO(0, 161, 110, 1)),),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: const BoxDecoration(color: Color.fromRGBO(171, 227, 210, 1)),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

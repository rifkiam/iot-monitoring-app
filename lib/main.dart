import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'IoT Monitoring App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool machineState = false;

  bool onOrOff() {
    //API
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 88, 77, 1),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: const Color.fromRGBO(255, 228, 121, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Color.fromRGBO(0, 114, 97, 1)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: Color.fromRGBO(0, 41, 55, 1)),
                        child: Text("💧", style: TextStyle(fontSize: 56)),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(width: 16,),
                    Text("pH \n")
                  ]
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Color.fromRGBO(0, 114, 97, 1)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: Color.fromRGBO(0, 41, 55, 1)),
                        child: Text("🌡", style: TextStyle(fontSize: 56)),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(width: 16,),
                    Text("Temp control \n")
                  ]
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Color.fromRGBO(0, 114, 97, 1)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: Color.fromRGBO(0, 41, 55, 1)),
                        child: Text("🌊", style: TextStyle(fontSize: 56)),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(width: 16,),
                    Text("Turbidity \n"),
                  ]
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Color.fromRGBO(0, 114, 97, 1)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: Color.fromRGBO(0, 41, 55, 1)),
                        child: Text("💧", style: TextStyle(fontSize: 56)),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(width: 16,),
                    Text("Water volume \n")
                  ]
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: SizedBox.expand(),
              )
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(color: Colors.black),
                child: const Text("Turn off", style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              ),
            )
          ],
        ),
      ),
    );
  }
}

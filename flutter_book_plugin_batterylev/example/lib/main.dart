import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterbookpluginbatterylev/flutterbookpluginbatterylev.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _batteryLevel = 'Unknown battery level';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await Flutterbookpluginbatterylev.batteryLevel();
      batteryLevel = "Battery level at $result";
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get Battery level : ${e}";
    } finally {
      setState(() {
        _batteryLevel = batteryLevel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text("Get Battery Level"),
                onPressed: _getBatteryLevel,
              ),
              Text("电量：$_batteryLevel")
            ],
          )
        ),
      ),
    );
  }
}

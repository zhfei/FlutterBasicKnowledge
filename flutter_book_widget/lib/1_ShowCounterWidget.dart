import 'package:flutter/material.dart';
import '3_CounterWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        body: CounterWidget(initValue: 2,),
      body: Text("hello world"),
      ),
    );
  }
}



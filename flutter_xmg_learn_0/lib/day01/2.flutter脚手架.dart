import 'package:flutter/material.dart';

//flutter: 2.脚手架
void main(List<String> args) => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp: google的一种设计风格
    return MaterialApp(
      //Scaffold: 脚手架
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('这是第一个Flutter项目标题'),),
      body: MyHomeBody(),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "Hello World",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.orange,
              fontSize: 20
          ),
        ));
  }
}

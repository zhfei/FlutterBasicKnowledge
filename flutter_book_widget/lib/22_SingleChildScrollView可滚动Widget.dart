import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("可滚动widget"),),
//        body: RowErrorDemo(),
//        body: WrapDemo(),
        body: SingleChildScrollViewTestRoute(),
      ),
    );
  }
}

//Scrollbar:要展示滚动条，就继承自Scrollbar
//SingleChildScrollView + Column
class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //Scrollbar:要展示滚动条，就继承自Scrollbar
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: str.split("").map((e) => Text(e, textScaleFactor: 2,)).toList(),
          ),
        ),
      ),
    );
  }
}


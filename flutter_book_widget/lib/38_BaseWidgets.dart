
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('组件大纲'),
          flexibleSpace: FlexibleSpaceBar(
            background: Icon(Icons.menu),
          ),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Hello World'),
          BaseWidgets()

        ],
      ),
    );
  }
}

//基础组件
/*
  Container: 容器，布局widget用来修饰可见widget,
  Row: 水平列表容器，多child widget,
  Column: 垂直列表容器，多child widget,
  Image,
  Text,
  RaisedButton,
  Scaffold: 脚手架，提供了appbar,底部sheet等API参数设置,
  AppBar,
  FlutterLogo,
  Placeholder,
 */

class BaseWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //对child widget进行修饰，包装的布局widget
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red)
          ),
          child: Text('Container 容器'),
        ),
        Image.asset('asset/images/cat.jpeg',width: 50,),
        Icon(Icons.send,color: Colors.green,),
        RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.green,
          child: Text("RaisedButton",style: TextStyle(color: Colors.white),),
          onPressed: (){},
        ),
        FlutterLogo(
          size: 80,
        ),
        Placeholder(
          color: Colors.red,
          fallbackHeight: 100,
        )
      ],
    );
  }
}





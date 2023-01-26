

import 'package:flutter/material.dart';

/*
  MaterialApp：采用了Google的Material设计设计规范的Widget,里面默认设置了文字排版方向等设置。
  Scaffold：脚手架Widget, 用于快速搭建页面机构，提供了不同位置的命名可选参数。

  debugShowCheckedModeBanner: 去掉右上角的debug条
*/

void main(List<String> args) {
  runApp(MyApp());
}


/*
  StatelessWidget: 在运行过程中，组件内容是固定的，没有状态修改的。
  StatefulWidget: 在运行过程中，状态(data)会产生改变，导致页面展示内容发生改变。
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBody()
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('第一个Flutter程序'),),
        body: PageContent()
      );
  }
  
}

class PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:Text('Hello Flutter', 
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
        ),
      )
    );
  }
  
}

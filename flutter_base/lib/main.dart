

import 'package:flutter/material.dart';

/*
  MaterialApp：采用了Google的Material设计设计规范的Widget,里面默认设置了文字排版方向等设置。
  Scaffold：脚手架Widget, 用于快速搭建页面机构，提供了不同位置的命名可选参数。

  debugShowCheckedModeBanner: 去掉右上角的debug条
*/

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
          appBar: AppBar(title: Text('第一个Flutter程序'),),
          body: Center(
            child:Text('Hello Flutter', 
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          )
        ),
      )
    )
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "material 风格",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("app Bar"),
      ),
      
      body: Center(
        child: Column(
          children: [
            Text("图片资源加载"),
            DecoratedBox(decoration: BoxDecoration(
              image: DecorationImage(
                         // 1.AssetImage并非是一个Widget, 它是一个ImageProvider
                  image: AssetImage('images/icon_per.png')),
            )),
            // 2.直接添加一个Image Widget
            Image.asset('images/icon_per.png'),
            // 3.加载第三方包中的图片资源
            Image.asset('images/icon_per.png',package: "第三方包名",)

          ],
        ),
      ),
    );
  }
}




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
        child: Text("文本资源加载"),
      ),
    );
  }
}


//使用rootBundle:每个Fullter应用默认都有一个rootBundle对象， 加载本地文本资源
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

//使用DefaultAssetBundle：当前build的上下文，通常在父级widget构建时调用
Future<String> loadAsset_2(BuildContext context) async {
  return await DefaultAssetBundle.of(context).loadString("assets/config.json");
}


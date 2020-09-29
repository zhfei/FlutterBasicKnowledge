import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "material 风格",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Bar"),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //生成随机字符串
    final wordPair = WordPair.random();

    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(wordPair.toString()),
    );
  }
}








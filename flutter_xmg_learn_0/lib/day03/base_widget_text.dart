import 'package:flutter/material.dart';

//查看一个抽象类的所有子类实现类：cmd+option+b

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础Widget-Text"),
      ),
      body: MyContent(),
    );
  }
}

class MyContent extends StatefulWidget {
  @override
  _MyContentState createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  @override
  Widget build(BuildContext context) {
    return RichTextDemo();
  }
}

//富文本
class RichTextDemo extends StatelessWidget {
  const RichTextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(text: "Hello Tom",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),),
        TextSpan(text: "Hello Jack",style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),),
        WidgetSpan(child: Icon(Icons.print, color: Colors.red,),),
        TextSpan(text: "Hello Lucy",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
      ]
    ));
  }
}

//基本文本
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "互联网巨头正在物业管理领域跑马圈地。\n8月13日，恒大物业宣布引入14名战略投资者，融资金额高达235亿港元。\n在豪华的战投队伍中，腾讯的身影再一次出现。",
      style: TextStyle(
        fontSize: 20,
        letterSpacing: 5,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(color: Colors.blue,offset: Offset(2, 1))
        ]
    ),
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}





import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("层叠布局"),),
        body: StackDemo(),
      ),
    );
  }
}


//层级高的覆盖层级低的
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ConstrainedBox: 确保Stack占满全屏
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        //确定 未定位或者部分定位weidget的对齐方式
        alignment: Alignment.center,
        //未确定Widget占满整个屏幕空间(部分定位不受影响)
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.amber,
            child: Text("Hello World", style: TextStyle(color: Colors.white, fontSize: 30),),
          ),
          Positioned(child: Text('I am lucy'), top: 18,),
          Positioned(child: Text("I am jack"), left: 18,),
        ],
      ),

    );
  }
}





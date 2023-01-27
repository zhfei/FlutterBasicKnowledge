

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

/*
  StatefulWidget内部无法写var属性, 因为它继承自Widget，Widget是被@immutable修饰，不可改变。所以它的状态改变要在别的类(State)中实现。
  State:在创建的State子类中添加var属性，并将其与Widget状态绑定，当有新的状态改变时，需要调用setState((){})进行更新状态
  Flutter的状态更新和React的机制一样，需要调用setState通知框架进行页面更新。
  与Vue不同的是Vue实例使用的是双向绑定，内部对属性做了监听，无需手动调用setState进行通知更新。

*/
class PageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageContentState();
  }
}

class PageContentState extends State<PageContent> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Checkbox(
              value: flag, 
              onChanged: (value) {
                setState(() {
                  flag = value;
                });
              },),
            Text('Hello World')
          ]
        )
    );
  }
  
}

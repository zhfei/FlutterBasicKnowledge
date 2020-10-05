import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("线性布局"),),
        body: RowDemo(),
//        body: ColumnInColumnDemo2(),
      ),
    );
  }
}


class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          //textDirection的排序方向从哪里开始，MainAxisAlignment.start就从哪里开始
          mainAxisAlignment: MainAxisAlignment.start,
          //设置子widget的children的排序方向
          textDirection: TextDirection.rtl,
          children: [
            Text(" hello world "),
            Text(" I am jack ")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            Text(" hello world "),
            Text(" I am jack "),
          ],
        ),
        Row(
          children: [
            ColumnInColumnDemo(),
          ],
        ),
      ],
    );
  }
}


//Column和Row相似，主要是两个属性概念
//textDirection的排序方向从哪里开始，MainAxisAlignment.start就从哪里开始
//mainAxisAlignment: MainAxisAlignment.start,
//设置子widget的children的排序方向
//textDirection: TextDirection.rtl,
class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


//Column的子widget包含Column
//外部Column的高度为整个屏幕有效，内部设置Column的高度为整个屏幕无效
class ColumnInColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //有效，外部Column的高度为整个屏幕
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.green,
          child: Column(
            //无效，内部Column设置最大无效
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(" hello world "),
              Text(" I am jack ")
            ],
          ),
        ),
      ],
    );
  }
}


//Column的子widget包含Column
//通过Expanded 使用内部Column占满外部Column
class ColumnInColumnDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //有效，外部Column的高度为整个屏幕
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: Container(
              color: Colors.red,
              child: Column(
                //无效，内部Column设置最大无效
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" hello world "),
                  Text(" I am jack ")
                ],
              ),
            ),
        ),
      ],
    );
  }
}



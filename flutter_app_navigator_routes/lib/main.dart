import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  return runApp(MaterialApp(
    home: MyAppHome(),
    routes: <String, WidgetBuilder> {
      '/a':(BuildContext context) => MyPage("page A"),
      '/b':(BuildContext context) => MyPage("page B"),
      '/c':(BuildContext context) => MyPage("page C"),
    },
  ));
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("home 的 AppBar 标题"),),
      body: Center(child: Text("Home 的内容"),),
      floatingActionButton: FloatingActionButton(tooltip: "长按提示",
        onPressed: (){
          Navigator.of(context).pushNamed('/b');
        },
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String title;
  MyPage(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("页面的内容 ${title}"),),
    );
  }
}

// 异步调用
getNavigatorCoor(BuildContext context) async {
  //push ，异步等待，等待Nav的pop返回的值
  Map coor = await Navigator.of(context).pushNamed('/c');

  //pop
  Navigator.of(context).pop({'lat':43.821757,'long':-79.226});
}
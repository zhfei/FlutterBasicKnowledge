import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CupertinoWidget(),
    );
  }
}


class CupertinoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Cupertino 风格 标题'),
          ),
          child: Center(
            child: CupertinoButton(child: Text("苹果风格"), onPressed: (){
              debugPrint('点击了');
            }),
          )
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FileOperationRoute(),
    );
  }
}


class FileOperationRoute extends StatefulWidget {
  FileOperationRoute({Key key}): super(key: key);
  @override
  _FileOperationRouteState createState() => _FileOperationRouteState();
}

class _FileOperationRouteState extends State<FileOperationRoute> {
  int _counter;
  Future<File> _getLocalFile() async {
    //获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }
  //从本地读计数
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      //读取点击次数
      String centents = await file.readAsString();
      return int.parse(centents);
    } on FileSystemException {
      return 0;
    }
  }
  //更新计数到本地
  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("本地文件操作"),),
      body: Center(
        child: Text("点击了 $_counter 次"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "增加计数",
        onPressed: (){
          _incrementCounter();
        },
      ),
    );
  }
}


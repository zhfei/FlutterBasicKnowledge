
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SocketDemo(),
      ),
    );
  }
}


class SocketDemo extends StatelessWidget {

  void _request() async {
    //1.建立链接
    Socket socket = await Socket.connect("baidu.com", 80);
    //2.根据http协议，发送请求头
    socket.writeln("GET / HTTP /1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connection:close");
    socket.writeln();
    //发送
    await socket.flush();

//    var _response = await socket.transform(utf8.decoder).join();
    await socket.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




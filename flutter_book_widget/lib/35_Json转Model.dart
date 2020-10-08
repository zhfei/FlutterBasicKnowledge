
import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: JsonModelDemo(),
      ),
    );
  }
}


class JsonModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //方式一
    //json格式用户列表字符串
    String jsonStr='[{"name":"Jack","email": "john1@example.com"},{"name":"Rose","email": "john2@example.com"}]';
    //将json字符串转成Dart对象
    List items = json.decode(jsonStr);
    //打印
    print(items.first["name"]);


    //方式二
    //可以使用ide的检查器，更安全
    //json格式用户列表字符串
    String jsonMapStr='{"name":"Jack","email": "john1@example.com"}';
    Map userMap = json.decode(jsonMapStr);
    var user = User.fromJson(userMap);
    print("方式二，map反编码：${user.name}");

    String toJsonMapStr = json.encode(user);
    print("方式二，map编码toJsonMapStr：${toJsonMapStr}");

    //方式三
    //自动生成model



    return Container();
  }
}



class User {
  final String name;
  final String email;

  User({this.name, this.email});
  User.fromJson(Map<String, dynamic> json) :name=json["name"],email=json["email"];

  Map<String, dynamic> toJson() => {
    "name":name,
    "email":email,
  };
}








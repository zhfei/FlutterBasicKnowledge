import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DioDemo(),
      ),
    );
  }
}


class DioDemo extends StatelessWidget {

  void _getDio() async {
    BaseOptions options = BaseOptions(baseUrl: "www.baidu.com");
    Dio dio = Dio(options);
    Response response;
    response = await dio.get("/test?id=12&name=wendu");
    print(response.data.toString());
  }

  void _getDio2() async {
    BaseOptions options = BaseOptions(baseUrl: "www.baidu.com");
    Dio dio = Dio(options);
    Response response;
    response = await dio.get("/test", queryParameters: {"id":12, "name":"wendu"});
    print(response.data.toString());
  }

  void _postDio() async {
    BaseOptions options = BaseOptions(baseUrl: "www.baidu.com");
    Dio dio = Dio(options);
    Response response;
    response = await dio.post("/test", data: {"id":12, "name":"wendu"});
    print(response.data.toString());

    //发起多个并发请求
    Future.wait([dio.post("/info"),dio.post('/token')]);
  }

  void _downDio() async {
    String _savePath ="";
    BaseOptions options = BaseOptions(baseUrl: "www.baidu.com");
    Dio dio = Dio(options);
    Response response;
    response = await dio.download("https://www.google.com", _savePath);
    print(response.data.toString());
  }

  void _formDataDio() async {
    FormData formData = FormData.fromMap({"name":"wendu", 'age':25});
    Dio dio = Dio();
    Response response;
    response = await dio.post("https://www.google.com",data: formData);
    print(response.data.toString());
  }

  void _formDataUploadMoreFilesDio() async {
    FormData formData = FormData.fromMap({
      "name":"wendu",
      'age':25,
      'file1': await MultipartFile.fromFile("./text.txt", filename: "upload.txt"),
    });
    Dio dio = Dio();
    Response response;
    response = await dio.post("https://www.google.com",data: formData);
    print(response.data.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Dio Demo"),
    );
  }
}




import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "App 的 标题",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyStateWidget(),
    );
  }
}

class MyStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppPageState();
  }
}

class _MyAppPageState extends State<MyStateWidget> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("异步加载 appBar 的标题"),),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }

  // 异步网络加载
  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";

    var responseBody;

    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(dataURL));
    var response = await request.close();
    if (response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      responseBody = jsonDecode(responseBody);

      setState(() {
        widgets = responseBody;
      });
    } else {
      print("error");
    }

  }

}


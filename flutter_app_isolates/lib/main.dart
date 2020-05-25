import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "app 的标题",
      theme: ThemeData(
          primaryColor: Colors.red
      ),
      home: MyStateWidget(),
    );
  }

}

class MyStateWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MYState();
  }

}

class MYState extends State<MyStateWidget> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar 的标题"),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }),
    );
  }


  // tools
  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Text ${widgets[i]["title"]}"),
    );
  }

  loadData() async {
    var responseBody;

    String dataUrl = "https://jsonplaceholder.typicode.com/posts";

    var httpClient = new HttpClient();
    var request =  await httpClient.getUrl(Uri.parse(dataUrl));
    var response = await request.close();

    if(response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      responseBody = jsonDecode(responseBody);
    }



  }

}
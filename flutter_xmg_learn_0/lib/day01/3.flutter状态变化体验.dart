
import 'package:flutter/material.dart';

//flutter: 2.脚手架
void main(List<String> args) => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp: google的一种设计风格
    return MaterialApp(
      //Scaffold: 脚手架
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('这是第一个Flutter项目标题'),),
      body: MyHomeBody(),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MyStateFullHomeBody()
    );
  }
}

class MyStateFullHomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyState();
  }

}

class MyState extends State<MyStateFullHomeBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: flag, onChanged: (value){
            print(value);
            this.setState(() {
              this.flag = value;
            });
          }),
          Text("同意协议")
        ],
      ),
    );
  }

}



import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "App 的 Title",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyStateWidget(),
    );
  }
}

class MyStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyState();
  }

}

class MyState extends State<MyStateWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("AppBar的标题"),),
      body: Center(
        child: CustomButton("自定义一个按钮，这是按钮的标题"),
      ),
    );
  }
}

// 自定义Widget Button
class CustomButton extends StatelessWidget {
  final String label;
  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(onPressed: (){}, child: Text(label),);
  }
}

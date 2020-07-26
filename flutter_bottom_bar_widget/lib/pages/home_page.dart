import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是标题"),
      ),
      body: Center(
        child: Text("Home 页面"),
      ),
    );
  }
}

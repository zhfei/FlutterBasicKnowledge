import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SwitchAndCheckBoxTestRoute(),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //单选框状态
  bool _checkBoxSelected = true; //复选框状态

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(value: _switchSelected, onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
          }),

          Checkbox(
              value: _checkBoxSelected,
              activeColor: Colors.red,
              //当tristate为true是，checkbox会有三种状态，多了一个null
              tristate: true,
              onChanged: (value){
              setState(() {
                _checkBoxSelected = value;
              });
          })

        ],
      ),
    );
  }
}


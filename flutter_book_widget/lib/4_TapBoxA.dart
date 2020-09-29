import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        body: CounterWidget(initValue: 2,),
        body: TabBoxA(),
      ),
    );
  }
}


//widget自己管理自己的state

class TabBoxA extends StatefulWidget {
  TabBoxA({Key key}) : super(key: key);

  @override
  _TabBoxAState createState() => _TabBoxAState();
}

class _TabBoxAState extends State<TabBoxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(_active ? "Active" : 'unactive',style: TextStyle(fontSize: 30, color: Colors.white),),
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(color: _active ? Colors.lightGreen : Colors.grey),
      ),
    );
  }
}

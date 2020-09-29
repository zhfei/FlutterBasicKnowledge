
import 'package:flutter/material.dart';

//父widget管理子widget的公共状态和子widget管理自己的私有状态

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ParentWidgetC(),
      ),
    );
  }
}


class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(active: _active, onChanged: _handleTapBoxChanged),
    );
  }
}

// 子widget

class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _heighActive = false;

  void tapDown(TapDownDetails details) {
    setState(() {
      _heighActive = true;
    });
  }

  void tapUp(TapUpDetails details) {
    setState(() {
      _heighActive = false;
    });
  }

  void tapClick() {
    widget.onChanged(!widget.active);
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child:  GestureDetector(
          onTap: tapClick,
          onTapUp: tapUp,
          onTapDown: tapDown,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen : Colors.grey,
//              border: BorderDirectional(
//                top: BorderSide(
//                  color: _heighActive ? Colors.blue : Colors.black,
//                  width: 10,
//                ),
//                bottom: BorderSide(
//                  color: _heighActive ? Colors.blue : Colors.black,
//                  width: 10,
//                ),
//              )
            border: Border.all(
              color: _heighActive ? Colors.blue : Colors.black,
              width: 10,
            )
            ),
          ),
      ),
    );
  }
}

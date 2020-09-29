import 'package:flutter/material.dart';
//父widget管理子widget的state

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapBoxChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(active: _active, onChange: _handleTapBoxChange,),
    );
  }
}

//--------------------

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChange;
  TapBoxB({Key key, this.active : false, @required this.onChange}):super(key: key);
  void _handleTap() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(active ? "Active" : "UnActive", style: TextStyle(color: Colors.white, fontSize: 30),),
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(color: active ? Colors.lightGreen : Colors.grey),
      ),
    );
  }
}


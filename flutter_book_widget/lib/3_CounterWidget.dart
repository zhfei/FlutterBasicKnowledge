import 'package:flutter/material.dart';


class CounterWidget extends StatefulWidget {
  final int initValue;
  CounterWidget({Key key ,this.initValue:0}):super(key:key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _counter = widget.initValue;
    debugPrint("initState");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Center(
      child: FlatButton(onPressed: (){
        setState(() {
          _counter++;
        });
      }, child: Text("计数总数：$_counter")),


    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    debugPrint('deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    debugPrint('dispose');
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();

    debugPrint('reassemble');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    debugPrint('didChangeDependencies');
  }
}






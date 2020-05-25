import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SampleApp());

class SampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App', theme: ThemeData(primarySwatch: Colors.red), home:SampleAppPage(),);
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key : key);

  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = "I like flutter";
  int _pressCount = 0;
  bool toggle = true;

  void _updateText() {
    setState(() {
      textToShow = "Flutter is Awesome!";
    });
  }

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle 等于true');
    } else {
      return CupertinoButton(child: Text('按钮，Toggle 等于False'), onPressed: (){});
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("AppBar 标题"),),
      body: Center(child: _getToggleChild(),),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: '工具点击',
        child: Icon(Icons.update),
      ),
//      body: Center(child: CupertinoButton(child: Text("按钮文字 ${_pressCount}"), onPressed: (){
//        setState(() {
//          _pressCount += 1;
//        });
//      },padding: EdgeInsets.only(left: 10,right: 10),)),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _updateText,
//        tooltip: "点击 进行更新",
//        child: Icon(Icons.update),
//      ),
    );
  }
}
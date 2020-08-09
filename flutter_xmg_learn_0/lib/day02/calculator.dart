
import 'dart:ffi';

import 'package:flutter/material.dart';

main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计算器"),
      ),
      body: MyBody(),
    );
  }
}

//为什么StatefulWidget的 build方法在 State中？
// Widget是一个描述对象，在页面绘制时，会频繁的销毁创建；
// State中的变量变化时，并不需要销毁重建state对象。
class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  var _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getButtons(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("当前计数为：", style: TextStyle(fontSize: 20),),
                Text("${_counter}", style: TextStyle(fontSize: 20, color: Colors.red),),
              ],
            )
          ],
        )
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: Icon(Icons.add, color: Colors.blue,),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
        RaisedButton(
          child: Icon(Icons.remove, color: Colors.pink,),
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
        ),
      ],
    );
  }
}




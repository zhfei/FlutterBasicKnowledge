import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome()
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('StateFullWidget')),
      body: MyBody()
    );
  }
}


class MyBody extends StatefulWidget {
  @override
  State<MyBody> createState() => _MyBodyState();
}

/*
  为什么Flutter设计的StatefulWidget的build方法放在State中？
  1.build方法创建的Widget是需要依赖State状态的(变量、数据)，
   而Widget中只能创建常量，无法创建变量，所以在State类中曲线救国来实现。
  2.在Flutter的运行中，Widget是不断销毁和重建的，而这个过程中并不希望State状态被不断重建
  State应该保持连贯性，所以把数据放到State类中。

*/
class _MyBodyState extends State<MyBody> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getButtons(),
          Text('当前计数为：${_counter}')
        ]
      ),
    );
  }

  Widget _getButtons() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Icon(Icons.add),
            color: Colors.red,
            onPressed: (){
              print('add');
              setState(() {
                _counter++;
              });
            }
          ),
          RaisedButton(
            child: Icon(Icons.subdirectory_arrow_left),
            color: Colors.pink,
            onPressed: (){
              print('sub');
              setState(() {
                _counter--;
              });
            }
          )
        ],
    );
  }
}

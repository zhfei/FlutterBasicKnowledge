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
      appBar: AppBar(title: Text("基础组件 - button"),),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RaisedButton(
          textColor: Colors.red,
          onPressed: () => print("1.RaisedButton click"),
          child: Text("按钮标题", style: TextStyle(fontSize: 20),),
        ),
        
        FlatButton(
          color: Colors.blue,
          onPressed: () => print("2.FlatButton click"),
          child: Text("按钮标题2", style: TextStyle(color: Colors.white),),
        ),
        
        OutlineButton(
          onPressed: () => print("3.OutlineButton click"),
          child: Text("按钮标题3"),
        ),
        
        FloatingActionButton(

          onPressed: () => print("4.FloatingActionButton click"),
          child: Icon(Icons.add),
        ),

        //自定义按钮，文字-图标-背景-圆角
        FlatButton(
          color: Colors.orange,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () => print("5.自定义按钮 click"), 
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_circle_outline,color: Colors.pink,),
                SizedBox(width: 5,),
                Text("点击播放")
              ],
            ))
      ],
    );
  }
}





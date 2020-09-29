import 'package:flutter/material.dart';
import 'NewRoute.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app 标题",
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("当前总数：$_count",style: TextStyle(color: Colors.red),),
          FlatButton(onPressed: (){
            setState(() {
              _count++;
            });
          }, child: Text("点击加1"),),
          FlatButton(
              onPressed: (){
                ///TODO: Navigator,页面路由管理器，维护一个路由栈
                Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return NewRoute();
                    },
                    maintainState: false,
                    fullscreenDialog: true
                    ),
                );
          }, child: Text("open new route",style: TextStyle(color: Colors.blue),))
        ],
      ),
    );
  }
}




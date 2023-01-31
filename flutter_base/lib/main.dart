import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          MyShoppingItem('iPhone 13', "大屏 好看", 'https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4023ed80e2794fb48858b4809b17f139~tplv-k3u1fbpfcp-no-mark:480:400:0:0.image?'),
          SizedBox(height: 10),
          MyShoppingItem('iPhone 13', "大屏 好看", 'https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4023ed80e2794fb48858b4809b17f139~tplv-k3u1fbpfcp-no-mark:480:400:0:0.image?'),
          SizedBox(height: 10),
          MyShoppingItem('iPhone 13', "大屏 好看", 'https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4023ed80e2794fb48858b4809b17f139~tplv-k3u1fbpfcp-no-mark:480:400:0:0.image?'),
        ],
    );
  }
}

class MyShoppingItem extends StatelessWidget {
  final title;
  final desc;
  final imageUrl;
  // 将TextStyle变成全局变量
  final titleTextStyle = TextStyle(fontSize: 30, color: Colors.orange);
  final descTextStyle = TextStyle(fontSize: 25, color: Colors.green);

  MyShoppingItem(this.title, this.desc, this.imageUrl);

  // Column: 主轴方向是垂直； Row: 主轴方向是水平

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(width: 5, color: Colors.green)),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.title, style: titleTextStyle,),
          SizedBox(height: 8,),
          Text(this.desc, style: descTextStyle,),
          SizedBox(height: 8,),
          Image.network(this.imageUrl)
        ],
      )
    );
  }
}

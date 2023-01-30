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
          MyShoppingItem('iPhone 13', "大屏 好看", 'https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4023ed80e2794fb48858b4809b17f139~tplv-k3u1fbpfcp-no-mark:480:400:0:0.image?'),
          MyShoppingItem('iPhone 13', "大屏 好看", 'https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4023ed80e2794fb48858b4809b17f139~tplv-k3u1fbpfcp-no-mark:480:400:0:0.image?'),
        ],
    );
  }
}

class MyShoppingItem extends StatelessWidget {
  final title;
  final desc;
  final imageUrl;
  MyShoppingItem(this.title, this.desc, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.title),
        Text(this.desc),
        Image.network(this.imageUrl)
      ],
    );
  }
}

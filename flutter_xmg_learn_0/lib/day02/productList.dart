import 'package:flutter/cupertino.dart';
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
        title: Text('商品列表'),
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductItem("商品1", "这个商品很好", "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596903152153&di=d872cbaebbb664277f19c355544645e8&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201203%2F30%2F163836w26j2wcimo0voawv.jpg"),
        SizedBox(height: 10,),
        ProductItem("商品1", "这个商品很好", "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596903152153&di=60698e016e66a98fbcdc5b8557391f68&imgtype=0&src=http%3A%2F%2Fi4.3conline.com%2Fimages%2Fpiclib%2F201202%2F03%2Fbatch%2F1%2F125616%2F1328200519998r5ft6we7u8.jpg"),
        SizedBox(height: 10,),
        ProductItem("商品1", "这个商品很好", "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596903152150&di=cf91a911d15474ac93c3cc470ff7bf96&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F1%2F57845a7b63097.jpg"),
       ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String desc;
  final String imageUrl;

  final nameStyle = TextStyle(fontSize: 30, color: Colors.red);
  final descStyle = TextStyle(fontSize: 20, color: Colors.blue);

  ProductItem(this.name, this.desc, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.deepPurpleAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: nameStyle,),
            ],
          ),
          Text(desc, style: descStyle,),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main(){
//  debugPaintSizeEnabled = true;
  runApp(MyContentShowApp());
}

/*
  信息展示：
  Image
  Image：图片展示，使用Image.network展示网络图片
  Icon
  Icon：通常用Icons.directions_bike来创建一个IconWidget
  Chip小标签
  Chip: 小标签, 可以同时设置Chip.avatar图标，Chip.label标识符，Chip.shape轮廓。Chip.shape轮廓可以通过RoundedRectangleBorder来设置圆角

 */

class MyContentShowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('信息展示 appBar'),
        ),
        body: ListView(
          children: [
            ImageDemo(),
            IconDemo(),
            ChipDemo()
          ],
        ),
      ),
    );
  }
}


//Image
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Image.network('https://pics3.baidu.com/feed/bd315c6034a85edf91d6560b09f9ad24dc5475f0.jpeg?token=7008bc8c6927a173afb973b13f75292a'),
    );
  }
}

//Icon
class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(Icons.directions_bike,color: Colors.green,),
      width: 60,
      height: 60,
    );
  }
}

//Chip: 小标签, 可以同时设置Chip.avatar图标，Chip.label标识符，Chip.shape轮廓。Chip.shape轮廓可以通过RoundedRectangleBorder来设置圆角
class ChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('iPhone12'),
      avatar: Icon(Icons.phone_iphone, color: Colors.lightBlue,),
      onDeleted: (){
        
      },
      deleteIcon: Icon(Icons.delete, color: Colors.red,),
      deleteButtonTooltipMessage: "删除购物车",
      backgroundColor: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}



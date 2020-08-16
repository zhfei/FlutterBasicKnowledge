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
      appBar: AppBar(title: Text("基础组件 - image"),),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final String imageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597583537567&di=8d5b7e259beb53f760d57b3573c155ab&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1048436104%2C284295033%26fm%3D214%26gp%3D0.jpg";

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageUrl),
      width: 300,
      height: 300,
      alignment: Alignment.bottomCenter,
      fit: BoxFit.contain,
      color: Colors.blue,
      colorBlendMode: BlendMode.darken,
      repeat: ImageRepeat.repeatY,
    );
  }
}





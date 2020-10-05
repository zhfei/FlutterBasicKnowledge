import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AssetImageDemo(),
              SizedBox(height: 20,),
              NetworkImageDemo(),
              SizedBox(height: 20,),
              IconFontsDemo(),
              SizedBox(height: 20,),
              IconFontsDemo_2(),
            ],
          ),
        ),
      ),
    );
  }
}


class AssetImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage("asset/images/cat.jpeg"), width: 100,),
        SizedBox(width: 20,),
        Image.asset("asset/images/dog.png")
      ],
    );
  }
}

class NetworkImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage("https://pics6.baidu.com/feed/21a4462309f790522aa4f6c0a7c58bcd7acbd557.jpeg?token=636123955cae17cc4f98eefbee51e43f"),
          width: 200,
          color: Colors.blue,
          colorBlendMode: BlendMode.colorBurn,
          alignment: Alignment.center,
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 20,),
        Image.network("https://pics3.baidu.com/feed/30adcbef76094b36eb58e9c8a91521de8c109d29.jpeg?token=689c7162187ccac0e01c23eb8d88756e",
            width: 120,
        ),
      ],
    );
  }
}


class IconFontsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = '';
    icons += '\uE914';
    icons += ' \uE000';
    icons += ' \uE90D';

    return Text(icons, style: TextStyle(
      fontFamily: "MaterialIcons",
      fontSize: 50,
      color: Colors.green
    ),);
  }
}


class IconFontsDemo_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.accessibility, color: Colors.green, size: 50,),
        SizedBox(width: 20,),
        Icon(Icons.error, color: Colors.green, size: 50,),
        SizedBox(width: 20,),
        Icon(Icons.fingerprint, color: Colors.green, size: 50,),
      ],
    );
  }
}





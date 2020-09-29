import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TextWidget(),
      ),
    );
  }
}


class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello world"*10,textAlign: TextAlign.center,),
          Text("Hello world"*10,textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text("Hello world",textScaleFactor: 1.6,),
          Text("Hello world"*5,
            style: TextStyle(
              fontSize: 20,
              height: 1.5,
              color: Colors.blue,
              backgroundColor: Colors.black12,
              fontFamily: "Courier",
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),
        ],
      ),
    );
  }
}


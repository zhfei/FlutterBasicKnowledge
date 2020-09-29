import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Echo(text: "Echo widget"),
      ),
    );
  }
}


class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const Echo({Key key,
    @required  this.text,
    this.backgroundColor,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Text(text),
        )
    );
  }
}




import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    Center(
        child:Text('Hello Flutter', 
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.red,
          fontSize: 30,
        ),
      )
    )
  );
}

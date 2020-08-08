// flutter: 1.上手
import 'package:flutter/material.dart';

main() {
  return runApp(
    Center(child: Text(
      "Hello World",
      textDirection: TextDirection.ltr,
      style: TextStyle(
          color: Colors.orange,
          fontSize: 20
      ),
    )),
  );
}
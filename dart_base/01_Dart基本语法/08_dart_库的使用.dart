import 'dart:math';

import '08_dart_自定义库_utils/math_utils.dart';



void main(List<String> args) {
  final num1 = 10;
  final num2 = 20;
  print(min(num1, num2));

  sub(num1, num2);
  
}

/*
  dart中，一个文件就是一个模块或一个库

  系统库
  dart中的Core核心库无需导入，默认导入。如使用的Map
  如果使用其他专门功能，就导入专门的库,如：
  import 'dart:async';
  import 'dart:io';
  import 'dart:库的名称';

*/
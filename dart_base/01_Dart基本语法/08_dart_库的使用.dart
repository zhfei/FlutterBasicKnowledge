import 'dart:math';
import 'dart:convert' as convert;

import '08_dart_自定义库_utils/math_utils.dart' as MathUtils;
// import '08_dart_自定义库_utils/math_utils.dart' show sum;
// import '08_dart_自定义库_utils/math_utils.dart' hide sub ;

import 'package:http/http.dart' as http;



void main(List<String> args) async {
  final num1 = 10;
  final num2 = 20;
  print(min(num1, num2));

  MathUtils.sub(num1, num2);

   var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  
}

/*
  dart中，一个文件就是一个模块或一个库
  注意：
  1.as关键字可以给库起别名
  2.默认情况下，导入一个库时会导入库中的所有内容，此时可以使用修饰词声明部分导入
    show: 声明要导入的部分
    hide: 声明要隐藏的部分
  import '08_dart_自定义库_utils/math_utils.dart' as MathUtils;
  import '08_dart_自定义库_utils/math_utils.dart' show sum;
  import '08_dart_自定义库_utils/math_utils.dart' hide sub ;
  3.export统一导出一类库文件，当一个目下有多个工具库时，可以统一放到一个文件中，集中导入防止每个都导入一次
    export 'io_utils.dart';
    export 'math_utils.dart'; 
  4.库文件中的私有方法是_开头的方法。  
  5.flutter项目第三方库管理文件pubspec.yaml, 然后执行pub get进行更新。
    name: zhoufei
    description: a dart lib
    dependencies:
      http: ^0.12.0


  系统库
  dart中的Core核心库无需导入，默认导入。如使用的Map
  如果使用其他专门功能，就导入专门的库,如：
  import 'dart:async';
  import 'dart:io';
  import 'dart:库的名称';


  自定义库
  导入方式
  import '08_dart_自定义库_utils/math_utils.dart'
  如果自定义库和当前模块或系统库方法名重复，可以是as重命名来区分
  import '08_dart_自定义库_utils/math_utils.dart' as MathUtils;

  第三方库
  导入方式
  import 'package:http/http.dart' as http;

*/
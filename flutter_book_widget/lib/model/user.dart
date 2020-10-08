import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

//生成命令
//方式一：1.进入项目根目录，2.执行命令：flutter packages pub run build_runner build
//方式二（效率更高）：1.进入到当前model目录下，2.执行命令：flutter packages pub run build_runner build
//方式三：使用监控命令，一次在终端执行，后面会自动生成：flutter packages pub run build_runner watch


//user.g.dart 在运行生成命令后 自动生成
part 'user.g.dart';


////自定义属性名
////显示关联Json字段名与Model属性的对应关系
//@JsonKey(name: "snake_case")
//final String lowerCameCase;


//告诉生成器，这个类需要生成Model类
@JsonSerializable()
class User {
  String name;
  String email;

  User({this.name, this.email});

  //不同的类使用不同的mixin
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
void main(List<String> args) {
  print("Hello Dart");


// 显示声明
String name = 'jack';
// 类型推断:类型推断的，也是有类型的。不同类型之间不能赋值。

// 类型推断变量
var age = 20;
age = 30;
// age = 30.3;

// 编译期常量
const school = '北京大学';
// 运行时常量
final local = DateTime.now();


const p1 = const Person('Tom');
const p2 = const Person('Tom');
const p3 = const Person('LiLei');

print(identical(p1, p2));
print(identical(p1, p3));

}


class Person {
  final String name;
  // 构造函数传参直接赋值到name属性上。
  const Person(this.name);
}




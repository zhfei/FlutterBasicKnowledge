import 'dart:web_gl';

void main(List<String> args) {
  // 虽然dart支持函数式开发，但是大部分使用的是面向对象开发。

  var p0 = Person('jim', 22);
  print(p0.toString());

  var s0 = Student.withMap({
    'name': 'jack',
    'age': 18,
    'height': 33.3
  });
  print(s0);

}

// 1.类的基本定义
// 类默认是继承自Object的，应用创建的对象是可以使用Object中的方法的。
class Person {
  String name;
  int age;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  // 语法糖
  Person(this.name, this.age); 

}

// 2.类的构造函数
class Student {
  String name;
  int age;
  double height;

  // a.便捷构造方法
  Student(this.name, this.age);
  // b.命名构造函数
  Student.withNameAgeHeight(this.name, this.age, this.height);

  /*
    dynamic和Object的区别
    dynamic是类型声明，var是类型推断，它是一个具体类型的声明，如String。
    dynamic是运行时报错
    Object是编译时报错
    Object可以父类指向子类对象。

    Object obj = 'hello';
    print(obj.toString(1));

  */
  Student.withMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.age = map['age'];
    this.height = map['height'];
  }


  // c.重新类的描述方法
  @override
  String toString() {
    // TODO: implement toString
    return "$age, $name, $height";
  }
}


// 3.类的初始化列表
class Teacher {
  final String name;
  final int age;

  /*
    构造函数的结构体执行时，是在构造函数执行后，所以对于final属性，它必须在构造函数执行时进行执行
    所以此时的执行时间就是在结构体执行时，故：它的执行是在():后面的初始化列表里执行。
    初始化列表里的执行不仅包含编辑期静态返回值，还包含了动态返回值。如：Color.blue
  */
  // Teacher(this.name, {int age = 10, String color}): this.color = color ?? '' {

  // }

  Teacher():this.name = 'jc', this.age = 10 {

  }
}




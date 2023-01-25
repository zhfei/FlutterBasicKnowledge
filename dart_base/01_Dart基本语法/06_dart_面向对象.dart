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

  // a.普通的构造方法
  Student(this.name, this.age);
  // b.命名构造函数：因为Dart中不支持函数重载，所以出现了命名构造函数来作为构造函数

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

    初始化列表:里面执行不仅包含编辑期静态返回值，还可以包含动态调用返回值。如：Color.blue
    可选命名表达式: 只能有赋值表达式，如：int age = temp ?? 20
  */
  // Teacher(this.name, {int age = 10, String color}): this.color = color ?? '' {

  // }

  Teacher():this.name = 'jc', this.age = 10 {

  }
}


// 4.构造函数重定向
class Doctor {
  int age;
  String name;

  // 构造函数重定向
  Doctor(String name): this._internal(name, 10);
  // 命名构造函数
  Doctor._internal(String name, int age);
}

// 常量构造函数，相同的属性只有一个内存对象。
class Apple {
  final String name;
  final int age;

  const Apple(this.name, this.age);
}

// 5.工厂构造函数：最大的特点可以手动返回一个对象。
/*
  普通构造函数不需要写return 会自动返回实例对象。
  工厂构造函数需要写return 手动返回实例对象。
  static：全局静态方法，类方法。
*/

class Orange {
  String name;
  String color;
  static final Map<String, Orange> _nameCache = {};
  static final Map<String, Orange> _colorCache = {};
  
  factory Orange.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final p = Orange(name, 'red');
      _nameCache[name] = p;
      return p;
    }
  }

  Orange(this.name, this.color);


}


// 6.Setter, Getter进行属性监听
// 使用方式是: var e = Elephone(); e.setName('jim'); e.getName
class Elephone {
  String name;
  // 在Dart中没有private public等修饰符，当对属性_开头时，表示这个属性是私有属性，只能在当前文件模块内访问。
  String _age;

  // setter
  set setName(String name) {
    this.name = name;
  }
  // getter
  String get getName {
    return name;
  }

}


// 7.继承：父类的构造函数要在子类的初始化列表中进行调用。
class Animal{
  String name;
  Animal(this.name);

  void eat() {
    print('eatting');
  }
}

class Dog extends Animal {
  int age;
  // 父类有构造函数时，需要在参数列表中进行调用，初始化。
  Dog(this.age, String name): super(name);
}


// 8.抽象类
// a.子类继承抽象父类，父类的接口方法必须实现，没有option可选项。
// b.抽象类不能实例化
/*
  c.系统抽象类Map实例化分析
  Map是一个抽象类，而可以调用Map()产生实例对象的原因是因为
  调用的Map()是Map抽象类的工厂方法external factory Map();

  external 是一个方法存在声明，表示此方法已经存在，但不在这里实现。这样实现和声明分离
  的好处是，可以在实现的地方使用runtimeType集中处理不同平台逻辑，而通过方法接口声明在不同的平台
  调用。 
  实现的地方使用@patch修饰。
*/
abstract class Shape {
  int getArea();
  String getInfo() {
    return '形状';
  }

  void testMap() {



    final m = Map();
    print(m.runtimeType);
  }
}

class Rectangle extends Shape {
  @override
  int getArea() {
    return 20;
  }
}



// 9.dart隐式接口：dart中定义的class同时也可以当接口使用。
/*
  dart中没有interface/ protocal这样专门定义接口的关键字
  dart中定义的class 同时也具有接口的功能，把class当接口使用时，class中定义的方法必须要全部实现。
  dart是单继承
*/

class Runner {
  void run() {
    print('running');
  }
}

class Fly {
  void fly() {
    print('fly');
  }
}

class SuperMan extends Animal implements Runner, Fly {
  SuperMan(String name):super(name);

  // 1.接口实现
  @override
  void run() {
    // TODO: implement run
  }

  @override
  void fly() {
    // TODO: implement fly
  }

  // 2.方法重写
  @override
  void eat() {
    // TODO: implement eat
    super.eat();
  }
}

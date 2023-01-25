void main(List<String> args) {

  // ??=: 如果前面的pro为null就执行后面的=赋值操作，如果pro有值就不执行后面的操作。
  // 可能有赋值操作
  var name = 'jim';
  var pro = null;
  pro ??= name;
  print(pro);

  // ??: 是?:三目运算符号的简写， 如果前面的变量有值则取前面的值，如果前面的值为空就取后面的值。
  // 一定有赋值操作
  var school = '小学';
  school = pro ?? '没人上学';
  print(school);


  // 级联运算符：可以连续调用..方法
  var p = Person()
      ..name = 'jim'
      ..eat()
      ..run();
  p.eat();

}

class Person {
  var name;
  void eat() {

  }

  void run() {

  }
}
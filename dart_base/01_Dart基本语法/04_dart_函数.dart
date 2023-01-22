void main(List<String> args) {
  print(sayHi(10, 20));

  // 顺序可选参数，传参的顺序必须和定义顺序相同
  sayHello1('jack', 30);
  // 命名可选参数，传参需要带定义的名称
  sayHello2('jack', age: 30);


  testFunc(foo);

}

// 1.函数的定义
// 返回值类型int 可以省略，但是推荐保留
int sayHi(int height, int age) {
  return age + height;
}


// 2.函数的可选参数
/*
   dart中没有函数的重载
   可选参数：位置可选参数 - 命名可选参数
   位置可选参数：[int age, double height]
   实参和形参在进行匹配时，是根据位置匹配的。

   命名可选参数：{int age, double height}
   实参和形参在进行匹配时，需要根据名称进行设置

   可选参数可以默认值，必传参数不需要默认值
*/
void sayHello1(String name, [int age, double height]) {

}

// 命名可选参数
void sayHello2(String name, {int age, double height}) {

}
// 命名可选参数带默认值
void sayHello3(String name, {int age, double height = 12}) {

}


// 3.函数是一等公民
/*
   一等公民是很灵活的，可以作为参数和返回值。
   OC中使用Block实现这一特性
*/

void testFunc(Function foo) {
  foo();
}

void foo() {
  print('foo 函数被调用');
}

// 4.匿名函数
void testFunc2() {
  // 多条语句
  testFunc(() {
    print('匿名函数被调用');
  });

  // 单条语句
  testFunc(() => print('箭头匿名函数，只能有一条语句') );

  // 匿名函数传参
  /*
    匿名传参，参数需要定义为完整的函数签名：void testFoo(int foo(int num1, int num2)) {}
  */
  testFoo((num1, num2) => num1 + num2);
  testFoo2((num1, num2) => num1 + num2);

  // 匿名返回值
  var foo3 = testFoo3();
  foo3(3, 3);

}

void testFoo(int foo(int num1, int num2)) {
  print(foo(10, 20));
}
typedef Calculate = int Function(int num1, int num2);
void testFoo2(Calculate cal) {
  cal(10, 10);
}

Calculate testFoo3() {
  return (int num1, int num2) => num1 * num2;
}

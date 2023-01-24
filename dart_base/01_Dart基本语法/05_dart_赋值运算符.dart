void main(List<String> args) {

  // ??=: 如果前面的pro为null就执行后面的=赋值操作，如果pro有值就不执行后面的操作。
  var name = 'jim';
  var pro = null;
  pro ??= name;
  print(pro);
}
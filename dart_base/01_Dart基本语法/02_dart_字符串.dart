

void main(List<String> args) {
  // 定义字符串三种方式：单引号，双引号，三引号
  var str1 = 'abc';
  var str2 = "def";
  var str3 = """
      ghi
      jkl
      mn
  """;

  print(str3);

  // 字符串拼接，拼接规则和shell很相似
  var name = 'jack';
  var age = 30;
  var height = 190.3;

  var msg1 = "name is $name, age is ${age}, height is ${height}, height Type is ${height.runtimeType}";
  print(msg1);

}


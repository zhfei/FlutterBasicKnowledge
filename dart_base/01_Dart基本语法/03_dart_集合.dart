void main(List<String> args) {
  // dart中没有关键字定义接口，默认情况下，所有的class都是隐式接口
  // dart在集合中广泛使用泛型来表示集合中存放的是什么类型。

  // 1.列表List
  var names = ['abc', 'cba', 'nba', 'cba', 'abc'];
  names.add('hhh');
  print(names);
  print(names.runtimeType);

  // 2.集合Set
  var movies = {'星际穿越', '大话西游', '盗梦空间'};
  names = Set<String>.from(names).toList();
  print(names);
  print(movies);


  // 3.映射Map
  // 映射的Key应该是可以求出hash值的。
  var info = {
    'name': 'jack',
    'age': 30
  };
  Map;
  print(info);
  print(info.runtimeType);
  
}
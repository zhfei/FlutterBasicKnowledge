
void main(List<String> args) {
  var color = Colors.red;

  switch (color) {
    case Colors.blue:
      print('蓝色');
      break;
    case Colors.red:
      print('红色');
      break;
    case Colors.yellow:
      print('黄色');
      break;
    default:
  };

  print(Colors.values);    
}

enum Colors {
  red,
  blue,
  yellow
}
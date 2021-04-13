main(List<String> args) {
  var a = 2;
  var b = 32452345.323;
  var c = true;
  var d = 'teste...';

  print(a);
  print(b);
  print(c);
  print(d);

  print(a.runtimeType);
  print(b.runtimeType);
  print(c.runtimeType);
  print(d.runtimeType);

  print(a is int);
  print(d is int);
}

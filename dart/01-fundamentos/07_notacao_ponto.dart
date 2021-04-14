main(List<String> args) {
  double nota = 6.99.roundToDouble();
  print(nota);

  nota = 6.99.truncateToDouble();
  print(nota);

  String s1 = "Leandro";
  String s2 = s1.substring(0, 4);
  String s3 = s2.toUpperCase();
  String s4 = s3.padRight(15, "!");

  String s5 = "Leandro".substring(0, 4).toUpperCase().padRight(15, "*");

  print(s4);
  print(s5);
}

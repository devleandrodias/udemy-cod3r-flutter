/**
 * - Números (int, double, num)
 * - String (String)
 * - Booleano (bool)
 * - dynamic
 */

main(List<String> args) {
  int n1 = 5;
  num x = 235.45;
  double n2 = (-346.36).abs();
  double n3 = double.tryParse("14.234")!;

  print(n1 + n2 + n3 + x);

  String s1 = "Bom";
  String s2 = " dia";

  print(s1 + s2.toUpperCase() + "!!!");

  bool estaChovendo = true;
  bool muitoFrio = false;

  print(estaChovendo && muitoFrio);

  dynamic dinamico = "x";

  print(dinamico);
  dinamico = 123.23;
  print(dinamico);
  dinamico = true;
  print(dinamico);

  // var variavel = 234;

  // variavel = "24"; Não permitido pro var
}

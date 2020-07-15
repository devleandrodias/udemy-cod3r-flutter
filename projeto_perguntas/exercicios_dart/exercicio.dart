main() {
  int a = 15;
  double b = 234.53;
  dynamic x = 123;
  x = false;
  x = "Teste";

  var saudacao = "Bom dia";
  var nomes = ["Leandro", "Thaísa", "Beatriz"];
  nomes.add("Daniel");

  Set<int> conjunto = {0, 1, 2, 3, 4, 5};

  Map<String, double> notasAlunos = {
    'Ana': 9.4,
    'Leandro': 10.0,
    'Leonardo': 9.9
  };

  print(conjunto is Set);

  var aa = 3;

  final bb = 4;

  const cc = 5;

  for (var chave in notasAlunos.keys) {
    print('$saudacao, $chave ${chave.length}');
  }
}

double exec(double a, double b, double Function(double, double) fn) => fn(a, b);

imprimirProduto({String nome, double preco}) {
  print('Produto $nome tem preço $preco');
}

class Produto {
  String nome;
  double preco;

  Produto({this.nome, this.preco});
}

main(List<String> args) {
  print(exec(2, 3, (a, b) => a - b));
  print(exec(2, 3, (a, b) => a + b));
  print(exec(2, 3, (a, b) => a / b));
  print(exec(2, 3, (a, b) => a * b));
  print(exec(2, 3, (a, b) => a % b));

  Produto p1 = Produto(nome: "Lápis", preco: 0.50);

  imprimirProduto(nome: p1.nome, preco: 15.5);

  print('O produto ${p1.nome} custa R\$${p1.preco}');
}

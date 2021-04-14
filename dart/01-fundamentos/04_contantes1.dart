import 'dart:io';

main(List<String> args) {
  // final pode ser definida em tempo de execução (Contante)
  // const pode ser definida em tempo de compilação (Constante)

  const PI = 3.1415;

  stdout.write('Informe seu nome de usuário: ');
  final String entradaUsuario = stdin.readLineSync()!;
  print('Nome do usuário... $entradaUsuario');

  stdout.write('Informe o raio: ');
  final double raio = double.parse(stdin.readLineSync()!);
  print('Valor do raio... $raio');

  final double area = PI * raio * raio;

  print('Valor da área é: $area');
}

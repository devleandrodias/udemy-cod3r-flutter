/**
 * - List
 * - Set
 * - Map
 */

main(List<String> args) {
  // Tem index, aceita repetição
  List aprovados = ['Ana', 'Carlos', 'Daniel', 'Rafael'];

  print(aprovados);

  print(aprovados.length);
  print(aprovados.reversed);

  print(aprovados[2]);
  print(aprovados.elementAt(2));

  // Tem index, aceita repetição, conjunto chave valor
  Map<String, String> telefones = {
    'João': '+55 (16) 15883-7483',
    'Maria': '+55 (16) 36859-4592'
  };

  print(telefones);
  print(telefones.length);
  print(telefones['Maria']);
  print(telefones.keys);
  print(telefones.values);
  print(telefones.entries);

  // Não tem index, não aceita repetição
  Set<String> times = {'Vasco', 'Flamento', 'São Paulo'};

  times.add('Cruzeiro');

  print(times);
  print(times.first);
  print(times.last);
  print(times.contains('Vasco'));
}

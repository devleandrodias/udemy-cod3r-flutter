import 'package:flutter/material.dart';

main(List<String> args) => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  void responder() {
    print('Pergunta respondida');
  }

  void Function() funcaoQueRetornaOutraFuncao() {
    return () {
      print('Pergunta respondida #03');
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito'
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas e Respostas'),
            ),
            body: Column(
              children: <Widget>[
                Text(perguntas[1]),
                RaisedButton(
                  child: Text('Resposta 1'),
                  onPressed: () => print(
                      'Resposta #01'), // passando a função como parâmetro e não invocando a função
                ),
                RaisedButton(
                  child: Text('Resposta 2'),
                  onPressed: () {
                    print('Resposta #02');
                  },
                ),
                RaisedButton(
                  child: Text('Resposta 3'),
                  onPressed: funcaoQueRetornaOutraFuncao(),
                ),
              ],
            )));
  }
}

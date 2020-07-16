import 'package:flutter/material.dart';

main(List<String> args) => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  final List<String> perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito'
  ];

  @override
  Widget build(BuildContext context) {
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
                  onPressed: null,
                ),
                RaisedButton(
                  child: Text('Resposta 2'),
                  onPressed: null,
                ),
                RaisedButton(
                  child: Text('Resposta 3'),
                  onPressed: null,
                ),
              ],
            )));
  }
}

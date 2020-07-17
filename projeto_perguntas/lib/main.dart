import 'package:flutter/material.dart';

main(List<String> args) => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
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
                Text(perguntas[perguntaSelecionada]),
                RaisedButton(
                  child: Text('Resposta 1'),
                  // passando a função como parâmetro e não invocando a função
                  onPressed: responder,
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

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

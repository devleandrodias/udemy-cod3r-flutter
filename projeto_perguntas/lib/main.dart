import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main(List<String> args) => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual a sua cor favorita?',
        'respostas': ['Cinza', 'Preto', 'Vermelho', 'Roxo']
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['-> Thaísa S2 <-', 'Macaco', 'Golfinho', 'Canguru']
      },
      {
        'texto': 'Qual seu instrutor favorito?',
        'respostas': ['Balta', 'Eduardo', 'Léo', 'Wesley', 'Rodrigo']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas e Respostas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

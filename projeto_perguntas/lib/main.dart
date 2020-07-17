import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main(List<String> args) => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas e Respostas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto']),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : Center(
                child: Text(
                  'Parabéns!!',
                  style: TextStyle(fontSize: 35),
                ),
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

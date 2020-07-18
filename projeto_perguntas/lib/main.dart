import 'package:flutter/material.dart';
import 'widgets/resultado.dart';
import 'widgets/questionario.dart';

main(List<String> args) => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Cinza', 'nota': 10},
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 10},
        {'texto': 'Roxo', 'nota': 10},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Ratazana', 'nota': 10},
        {'texto': 'Macaco', 'nota': 10},
        {'texto': 'Golfinho', 'nota': 10},
        {'texto': 'Canguru', 'nota': 10},
      ]
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Balta', 'nota': 10},
        {'texto': 'Eduardo', 'nota': 10},
        {'texto': 'Léo', 'nota': 10},
        {'texto': 'Wesley', 'nota': 10},
        {'texto': 'Rodrigo', 'nota': 10},
      ]
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas e Respostas')),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(),
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

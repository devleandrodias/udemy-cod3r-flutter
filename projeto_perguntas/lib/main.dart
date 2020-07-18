import 'package:flutter/material.dart';
import 'widgets/resultado.dart';
import 'widgets/questionario.dart';

main(List<String> args) => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Cinza', 'pontuacao': 2},
        {'texto': 'Preto', 'pontuacao': 4},
        {'texto': 'Vermelho', 'pontuacao': 7},
        {'texto': 'Roxo', 'pontuacao': 4},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Ratazana', 'pontuacao': 4},
        {'texto': 'Macaco', 'pontuacao': 3},
        {'texto': 'Golfinho', 'pontuacao': 7},
        {'texto': 'Canguru', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Balta', 'pontuacao': 6},
        {'texto': 'Eduardo', 'pontuacao': 3},
        {'texto': 'Léo', 'pontuacao': 1},
        {'texto': 'Wesley', 'pontuacao': 5},
        {'texto': 'Rodrigo', 'pontuacao': 3},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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

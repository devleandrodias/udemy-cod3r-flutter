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
        {'texto': 'Cinza', 'pontuacao': 10},
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Roxo', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Ratazana', 'pontuacao': 10},
        {'texto': 'Macaco', 'pontuacao': 10},
        {'texto': 'Golfinho', 'pontuacao': 10},
        {'texto': 'Canguru', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Balta', 'pontuacao': 10},
        {'texto': 'Eduardo', 'pontuacao': 10},
        {'texto': 'Léo', 'pontuacao': 10},
        {'texto': 'Wesley', 'pontuacao': 10},
        {'texto': 'Rodrigo', 'pontuacao': 10},
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

    print(_pontuacaoTotal);
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
            : Resultado(_pontuacaoTotal),
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

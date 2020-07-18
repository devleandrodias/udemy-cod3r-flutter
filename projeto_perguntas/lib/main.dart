import 'package:flutter/material.dart';
import 'widgets/resultado.dart';
import 'widgets/questionario.dart';

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

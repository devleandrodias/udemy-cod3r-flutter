import 'package:flutter/material.dart';

main(List<String> args) => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas e Respostas'),
      ),
      body: Text('Olá Flutter!!'),
    ));
  }
}

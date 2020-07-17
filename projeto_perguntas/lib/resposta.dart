import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text(texto),
        onPressed: onSelecao,
      ),
    );
  }
}

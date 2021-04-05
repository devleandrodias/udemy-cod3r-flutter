import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: ElevatedButton(
        child: Text(texto),
        onPressed: onSelecao,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
        ),
      ),
    );
  }
}

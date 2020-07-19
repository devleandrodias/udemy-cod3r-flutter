import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main(List<String> args) => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Nova Blusa Nike',
      value: 210.34,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 120.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'iMac 27, 5K',
      value: 10034.69,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        backgroundColor: Colors.purple[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Gráfico'),
              elevation: 2,
            ),
          ),
          Column(
            children: _transactions.map((e) {
              return Card(
                child: Text(e.title),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

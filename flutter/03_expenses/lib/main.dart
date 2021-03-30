import 'dart:math';
import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
import 'models/transaction.dart';

main(List<String> args) => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        primarySwatch: Colors.purple,
        accentColor: Colors.pink[600],
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentReansactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextBool().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TransactionForm(_addTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 17 * MediaQuery.textScaleFactorOf(context),
        ),
      ),
      backgroundColor: Colors.purple[700],
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ],
    );

    final avaliableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: avaliableHeight * 0.25,
              child: Chart(_recentReansactions),
            ),
            Container(
              height: avaliableHeight * 0.75,
              child: TransactionList(
                _transactions,
                _removeTransaction,
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _openTransactionFormModal(context),
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

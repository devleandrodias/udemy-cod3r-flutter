import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubimit;

  TransactionForm(this.onSubimit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) return;

    this.onSubimit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Nova Transação'),
                textColor: Colors.purple[600],
                onPressed: _submitForm(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

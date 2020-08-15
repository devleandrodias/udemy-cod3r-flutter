import 'package:flutter/material.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produtos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Preço',
              ),
              focusNode: _priceFocusNode,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              textInputAction: TextInputAction.next,
            )
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScree extends StatelessWidget {
  final Category category;

  const CategoriesMealsScree({
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas por categoria ${category.id}'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.widget.dart';

class CategoriesMealsScree extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScree(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoriesMeals = meals
        .where((element) => element.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoriesMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              meal: categoriesMeals[index],
            );
          },
        ),
      ),
    );
  }
}

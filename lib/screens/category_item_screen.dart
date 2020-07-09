import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

import '../Dummy_data.dart';

class CategorySelected extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;
//
//  CategorySelected();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealsScreen(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}

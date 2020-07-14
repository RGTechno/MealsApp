import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';
import '../models/meals.dart';

class CategorySelected extends StatefulWidget {
  final List<Meal> mealsAvailable;

  CategorySelected(this.mealsAvailable);

//  final String categoryId;
//  final String categoryTitle;
//
//  CategorySelected();

  @override
  _CategorySelectedState createState() => _CategorySelectedState();
}

class _CategorySelectedState extends State<CategorySelected> {
  String categoryTitle;
  List<Meal> categoryMealDisplayed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    categoryMealDisplayed = widget.mealsAvailable.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(mealId) {
    setState(() {
      categoryMealDisplayed.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            id: categoryMealDisplayed[index].id,
            title: categoryMealDisplayed[index].title,
            affordability: categoryMealDisplayed[index].affordability,
            complexity: categoryMealDisplayed[index].complexity,
            duration: categoryMealDisplayed[index].duration,
            imageUrl: categoryMealDisplayed[index].imageUrl,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMealDisplayed.length,
      ),
    );
  }
}

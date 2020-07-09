import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final routeArgsId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("$routeArgsId"),
      ),
      body: Center(
        child: Text("This is Meal $routeArgsId"),
      ),
    );
  }
}

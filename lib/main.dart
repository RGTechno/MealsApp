import 'package:flutter/material.dart';
import './Dummy_data.dart';
import './models/meals.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_item_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filter) {
    setState(() {
      _filters = filter;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters["gluten"] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] == true && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavouriteMeal(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavourited(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 24,
                fontFamily: "MontserratSemiBold",
                color: Colors.white,
              ),
              headline5: TextStyle(
                fontSize: 19,
                fontFamily: "MontserratLight",
                fontWeight: FontWeight.bold,
              ),
              headline4: TextStyle(
                fontSize: 19,
                fontFamily: "MontserratLight",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: ,
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(_favouriteMeals),
        "/category": (ctx) => CategorySelected(_availableMeals),
        "/detail": (ctx) => MealDetailScreen(_toggleFavouriteMeal, _isFavourited),
        "/filters": (ctx) => FiltersScreen(_filters, _setFilters)
      },
//      onGenerateRoute: () {},
//      onUnknownRoute: () {},
    );
  }
}

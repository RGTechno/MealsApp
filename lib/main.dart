import 'package:flutter/material.dart';
import './screens/category_item_screen.dart';

import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                  color: Colors.white),
              headline5: TextStyle(
                fontSize: 19,
                fontFamily: "MontserratLight",
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CategoriesScreen(),
      routes: {"/category": (ctx) => CategorySelected()},
    );
  }
}

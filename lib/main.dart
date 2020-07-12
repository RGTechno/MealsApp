import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_item_screen.dart';

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
        "/": (ctx) => TabsScreen(),
        "/category": (ctx) => CategorySelected(),
        "/detail": (ctx) => MealDetailScreen(),
        "/filters": (ctx) => FiltersScreen()
      },
//      onGenerateRoute: () {},
//      onUnknownRoute: () {},
    );
  }
}

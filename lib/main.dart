import 'package:flutter/material.dart';

import './categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6:
                    TextStyle(fontSize: 24, fontFamily: "MontserratSemiBold", color: Colors.white),
            headline5:
            TextStyle(fontSize: 18, fontFamily: "MontserratLight"),
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CategoriesScreen());
  }
}

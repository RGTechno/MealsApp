import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": FavouritesScreen(),
      "title": "Favourites",
    },
  ];

  int _selectedTabIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedTabIndex]["title"],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: _pages[_selectedTabIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedTabIndex,
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text(
              "Categories",
              style: TextStyle(
                fontFamily: "MontserratLight",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text(
              "Favourites",
              style: TextStyle(
                fontFamily: "MontserratLight",
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

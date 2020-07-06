import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/category_item_screen.dart';
import './Dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Project",style: Theme.of(context).textTheme.headline6,),
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        children: dummy
            .map((e) => CategoryItem(
                  e.id,
                  e.title,
                  e.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}

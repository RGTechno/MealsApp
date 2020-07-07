import 'package:flutter/material.dart';

class CategorySelected extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;
//
//  CategorySelected();

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeArgs["title"];
//    final categoryId = routeArgs["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle,style: Theme.of(context).textTheme.headline6,),
      ),
      body: Center(
        child: Text("Welcome to new page"),
      ),
    );
  }
}

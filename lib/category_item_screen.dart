import 'package:flutter/material.dart';

class CategorySelected extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategorySelected(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("Welcome to new page"),
      ),
    );
  }
}

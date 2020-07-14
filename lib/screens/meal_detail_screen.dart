import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildDetailTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black54),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 225,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgsId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((meal) => meal.id == routeArgsId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${selectedMeal.title}",
          style: Theme.of(context).textTheme.headline4,
          overflow: TextOverflow.fade,
          softWrap: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(selectedMeal.imageUrl),
            ),
            buildDetailTitle(context, "Ingredients"),
            buildListContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "MontserratLight",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildDetailTitle(context, "Steps"),
            buildListContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${(index + 1)}"),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                            fontFamily: "MontserratLight",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(routeArgsId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourite(routeArgsId),
      ),
    );
  }
}

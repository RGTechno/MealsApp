import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealsScreen extends StatelessWidget {

  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  MealsScreen({
    @required this.affordability,
    @required this.complexity,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
  });

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Medium:
        return "Medium";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "NO_Opinion";
    }
  }

  String get affordabilityText {
    switch(affordability) {
      case Affordability.cheap:
        return "Cheap";
        break;
      case Affordability.pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
      default:
        return "NO_Opinion";
    }
  }

  void mealSelected() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: mealSelected,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text("$duration min"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 5,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

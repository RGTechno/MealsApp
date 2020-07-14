import 'package:flutter/material.dart';
import '../models/meals.dart';
import './category_meal_screen.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouritesScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeal.isEmpty){
      return Center(
        child: Text("You Haven't added any favourites!"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsScreen(
            id: favouriteMeal[index].id,
            title: favouriteMeal[index].title,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
            imageUrl: favouriteMeal[index].imageUrl,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}

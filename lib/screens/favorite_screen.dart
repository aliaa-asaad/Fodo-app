import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../widgets/items/meal_card.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Meal> favoriteMeals=Provider.of<MealProvider>(context,listen: true).favoriteMeals;
    return Scaffold(
      body: Stack(children: [
        Background(
          image: 'assets/images/brown.jpg',
        ),
        favoriteMeals.isEmpty
            ? Center(
                child: Text('Empty',style: TextStyle(fontSize: 30,color:Colors.white),),
              )
            :  ListView.builder(
          itemBuilder: (context, index) => MealCard(
            id: favoriteMeals![index].id,
            title: favoriteMeals![index].title,
            imageUrl: favoriteMeals![index].imageUrl,
            duration: favoriteMeals![index].duration,
            complexity: favoriteMeals![index].complexity,
            affordability: favoriteMeals![index].affordability,
          ),
          itemCount: favoriteMeals!.length,
        ),
      ]),
    );
  }
}

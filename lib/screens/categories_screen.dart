import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/items/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;

  const CategoriesScreen({ required this.availableMeals});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
          Duration(seconds: 5), () => Center(child: CircularProgressIndicator(),),),
      builder: (context, snapshot) => Scaffold(
        body: Stack(children: [
          Background(
            image: 'assets/images/black.jpg',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              children: DUMMY_CATEGORY
                  .map((data) => CategoryItem(data.title, data.id, data.image))
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20),
            ),
          ),
        ]),
      ),
    );
  }
}

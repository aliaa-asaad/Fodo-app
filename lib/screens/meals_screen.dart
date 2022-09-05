import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/items/meal_card.dart';

class MealScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const MealScreen({ required this.availableMeals});
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String? categoryTitle;
  List<Meal>? displayMeals;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    categoryTitle = routeArg['title'];
    displayMeals =widget.availableMeals.where((meal) {
      return meal.category!.contains(routeArg['id']);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String Id) {
    setState(() {
      displayMeals!.removeWhere((meal) => meal.id == Id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle!,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Stack(children: [
          Background(
            image: 'assets/images/black.jpg',
          ),
          ListView.builder(
            itemBuilder: (context, index) => MealCard(
              id: displayMeals![index].id,
              title: displayMeals![index].title,
              imageUrl: displayMeals![index].imageUrl,
              duration: displayMeals![index].duration,
              complexity: displayMeals![index].complexity,
              affordability: displayMeals![index].affordability,

            ),
            itemCount: displayMeals!.length,
          ),
        ]));
  }
}

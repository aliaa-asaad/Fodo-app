import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/custom_widgets.dart';
import 'package:meal_app/constance.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function? toggleFavorite;
  final Function? isFav;

  const MealDetailsScreen({this.toggleFavorite, this.isFav});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final selectedComplexity = selectedMeal.complexity;
    final selectedAffordability = selectedMeal.affordability;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: ()=>toggleFavorite!(mealId),
            icon: isFav!(mealId)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border))
      ], title: Text(selectedMeal.title!)),
      body: Stack(children: [
        Background(
          image: 'assets/images/black.jpg',
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(selectedMeal.imageUrl!),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                //-------------------------------------

                //title
                Text(
                  selectedMeal.title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                //-------------------------------------

                //icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconCard(
                      text: '${selectedMeal.duration} min',
                      color: Color(0xffE9D0B4).withOpacity(.8),
                      icon: Icons.schedule,
                    ),
                    IconCard(
                      text:
                          '${Constance(complexityConst: selectedComplexity).complexityText}',
                      color:
                          Theme.of(context).colorScheme.primary.withOpacity(.8),
                      icon: Icons.assessment_outlined,
                    ),
                    IconCard(
                      text:
                          '${Constance(affordabilityConst: selectedAffordability).affordabilityText} ',
                      color: Color(0xffE9D0B4).withOpacity(.8),
                      icon: Icons.attach_money,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //-------------------------------------

                //cards
                CustomCard(
                    list: selectedMeal.ingredients!, text: 'Integrations'),
                CustomCard(list: selectedMeal.steps!, text: 'Steps')
                //-------------------------------------
              ],
            ),
          ),
        ),
      ]),

    );
  }
}

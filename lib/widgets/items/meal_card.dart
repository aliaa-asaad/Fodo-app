import 'package:flutter/material.dart';
import 'package:meal_app/constance.dart';
import 'package:meal_app/models/meal.dart';

class MealCard extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;

  const MealCard({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void selectMeal(ctx) =>
      Navigator.of(ctx).pushNamed('mealDetails', arguments: id).then((result) {
      //  if (result != null) removeItem!(result);
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                //-----------------image----------------
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl!,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                //---------------------------------

                //-----------------text----------------
                Container(
                  height: 200,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Color(0xff9679B1).withOpacity(1),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),
                //---------------------------------
              ],
            ),
            //-----------------icons----------------
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffE9D0B4),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.assessment_outlined),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          '${Constance(complexityConst: complexity).complexityText}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          '${Constance(affordabilityConst: affordability).affordabilityText}'),
                    ],
                  )
                ],
              ),
            )
            //---------------------------------
          ],
        ),
      ),
    );
  }
}

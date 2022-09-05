import 'package:flutter/cupertino.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard;
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious;
}

class Meal {
  final String? id;
  final String? title;
  final String? imageUrl;
  final List<String>? category;
  final List<String>? ingredients;
  final List<String>? steps;
  final int? duration;
  final bool? isGlutenFree;
  final bool? isLactoseFree;
  final bool? isVegan;
  final bool? isVegetarian;
  final Complexity? complexity;
  final Affordability? affordability;

  const Meal(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.category,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.complexity,
      @required this.affordability,
      });
}

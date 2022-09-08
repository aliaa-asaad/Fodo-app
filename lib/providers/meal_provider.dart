import 'package:flutter/cupertino.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class MealProvider with ChangeNotifier {
  Map<String?, bool?> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters() {
    availableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] == true && meal.isGlutenFree == false) {
        return false;
      }
      if (filters['lactose'] == true && meal.isLactoseFree == false) {
        return false;
      }
      if (filters['vegan'] == true && meal.isVegan == false) {
        return false;
      }
      if (filters['vegetarian'] == true && meal.isVegetarian == false) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }

  bool? isFavoriteMeal = false;

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    isFavoriteMeal = favoriteMeals.any((meal) => meal.id == mealId);
    notifyListeners();
  }
}

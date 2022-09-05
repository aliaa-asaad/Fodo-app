import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String?, bool?> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String?, bool?> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavoriteMeal(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fodo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xff9679B1), onSecondary: Color(0xffE9D0B4)),
        fontFamily: 'RobotoCondensed',
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
            bodyText1: TextStyle(fontSize: 20, color: Colors.black)),
      ),
      routes: {
        '/': (context) => TabsScreen(
          favoriteMeals: _favoriteMeals,
            currentFilter: _filters,
            availableMeals: _availableMeals,
            saveFilters: _setFilters),
        'meal': (context) => MealScreen(availableMeals: _availableMeals),
        'mealDetails': (context) => MealDetailsScreen(
            toggleFavorite: _toggleFavorite, isFav: _isFavoriteMeal)
      },
    );
  }
}

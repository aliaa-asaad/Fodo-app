import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/screens/splash_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MealProvider>(
    create: (ctx) => MealProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FODO App',
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
        '/': (context) => SplashScreen(),
        'meal': (context) => MealScreen(),
        'tab': (context) => TabsScreen(),
        'mealDetails': (context) => MealDetailsScreen()
      },
    );
  }
}

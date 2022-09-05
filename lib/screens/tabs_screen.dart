import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/settings_screen.dart';

import '../models/meal.dart';
import '../widgets/custom_widgets.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  final Function? saveFilters;
  final Map<String?, bool?> currentFilter;
  final List<Meal> favoriteMeals;

  const TabsScreen(
      {required this.availableMeals,
      required this.saveFilters,
      required this.currentFilter, required this.favoriteMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selcetedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(
          availableMeals: widget.availableMeals,
        ),
        'title': 'Categories'
      },
      {'page': FavoriteScreen( favoriteMeals: widget.favoriteMeals,), 'title': 'Favorites'},
      {
        'page': SettingsScreen(
            currentFilter: widget.currentFilter,
            saveFilters: widget.saveFilters),
        'title': 'Settings'
      }
    ];
    super.initState();
  }

  void _selectedPage(int value) {
    setState(() {
      _selcetedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(title: Text('${_pages[_selcetedPageIndex]['title']}',style: Theme.of(context)
        .textTheme.headline1)),*/
      body: Stack(
        children: [
          Background(
            image: 'assets/images/black.jpg',
          ),
          _pages![_selcetedPageIndex]['page'],
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 15,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.onSecondary,
          unselectedItemColor: Colors.black,
          onTap: _selectedPage,
          currentIndex: _selcetedPageIndex,
          items: [
            BottomNavigationBarItem(
                label: 'Categories',
                icon: Icon(
                  Icons.dashboard_outlined,
                )),
            BottomNavigationBarItem(
                label: 'Favorites', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: 'Settings', icon: Icon(Icons.settings))
          ]),
    );
  }
}

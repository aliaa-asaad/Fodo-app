import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/settings_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selcetedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(), 'title': 'Favorites'},
      {'page': SettingsScreen(), 'title': 'Settings'}
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
      body: Stack(
        children: [
          _pages![_selcetedPageIndex]['page'],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 30,

          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).colorScheme.onSecondary,
          unselectedItemColor: Colors.brown.shade900,
          onTap: _selectedPage,
          currentIndex: _selcetedPageIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: 'Categories',
                icon: Icon(
                  Icons.dashboard_outlined,
                )),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: 'Favorites', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: 'Settings', icon: Icon(Icons.settings))
          ]),
    );
  }
}

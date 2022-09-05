import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/custom_widgets.dart';

import '../models/meal.dart';

class SettingsScreen extends StatefulWidget {
  final Function? saveFilters;
  final Map<String?, bool?> currentFilter;

  const SettingsScreen({this.saveFilters, required this.currentFilter});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool? isGlutenFree = false;
  bool? isLactoseFree = false;
  bool? isVegan = false;
  bool? isVegetarian = false;
  List filter = [
    {'title': 'Gluten', 'caption': 'Only include gluten-free meals.'},
    {'title': 'Lactose', 'caption': 'Only include lactose-free meals.'},
    {'title': 'Vegan', 'caption': 'Only include vegan meals.'},
    {'title': 'Vegetarian', 'caption': 'Only include Vegetarian meals.'}
  ];

  @override
  initState() {
    isGlutenFree = widget.currentFilter['gluten'];
    isLactoseFree = widget.currentFilter['lactose'];
    isVegan = widget.currentFilter['vegan'];
    isVegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/black.jpg',
                ),
                fit: BoxFit.fill)),
        child: Column(children: [
          Container(
            height: 600,
            width: 600,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: isGlutenFree,
                    name: filter[0]['title'],
                    caption: filter[0]['caption'],
                    change: (value) {
                      setState(() {
                        isGlutenFree = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: isLactoseFree,
                    name: filter[1]['title'],
                    caption: filter[1]['caption'],
                    change: (value) {
                      setState(() {
                        isLactoseFree = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: isVegan,
                    name: filter[2]['title'],
                    caption: filter[2]['caption'],
                    change: (value) {
                      setState(() {
                        isVegan = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: isVegetarian,
                    name: filter[3]['title'],
                    caption: filter[3]['caption'],
                    change: (value) {
                      setState(() {
                        isVegetarian = value;
                      });
                    }),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  final Map<String?, bool?> selectedFilters = {
                    'gluten': isGlutenFree!,
                    'lactose': isLactoseFree!,
                    'vegan': isVegan!,
                    'vegetarian': isVegetarian!,
                  };
                  widget.saveFilters!(selectedFilters);
                  print('done');
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      left: 50, right: 50, bottom: 20, top: 20))),
              child: Text('Save')),
        ]),
      ),
    ));
  }
}

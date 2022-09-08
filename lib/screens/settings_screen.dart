import 'package:flutter/material.dart';
import 'package:meal_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import '../providers/meal_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List filter = [
    {'title': 'Gluten', 'caption': 'Only include gluten-free meals.'},
    {'title': 'Lactose', 'caption': 'Only include lactose-free meals.'},
    {'title': 'Vegan', 'caption': 'Only include vegan meals.'},
    {'title': 'Vegetarian', 'caption': 'Only include Vegetarian meals.'}
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String?, bool?> currentFilter =
        Provider.of<MealProvider>(context, listen: true).filters;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/brown.jpg',
                ),
                fit: BoxFit.fill)),
        child: Column(children: [
          Container(
            height: 600,
            width: 600,
            margin: EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: currentFilter['gluten'],
                    name: filter[0]['title'],
                    caption: filter[0]['caption'],
                    change: (value) {
                      setState(() {
                        currentFilter['gluten'] = value;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    }),
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: currentFilter['lactose'],
                    name: filter[1]['title'],
                    caption: filter[1]['caption'],
                    change: (value) {
                      setState(() {
                        currentFilter['lactose'] = value;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    }),
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: currentFilter['vegan'],
                    name: filter[2]['title'],
                    caption: filter[2]['caption'],
                    change: (value) {
                      setState(() {
                        currentFilter['vegan'] = value;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    }),
                SizedBox(
                  height: 20,
                ),
                SwitchTile(
                    val: currentFilter['vegetarian'],
                    name: filter[3]['title'],
                    caption: filter[3]['caption'],
                    change: (value) {
                      setState(() {
                        currentFilter['vegetarian'] = value;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    }),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}

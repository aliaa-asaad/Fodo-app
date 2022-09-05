import 'package:flutter/material.dart';
import 'package:meal_app/widgets/custom_widgets.dart';

class CategoryItem extends StatelessWidget {
  final String? title;
  final String? id;
  final String? image;

  CategoryItem(this.title, this.id,this.image);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('meal', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.primary,
      onTap: () => selectCategory(context),
      child: Stack(children: [
        //---------------------image-------------------------
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          child: Background(image: image!),
        ),
        //----------------------------------------------
        //---------------------title-------------------------
        Container(
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
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        //----------------------------------------------
      ]),
    );
  }
}

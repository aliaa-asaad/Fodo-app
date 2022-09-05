import 'package:meal_app/models/meal.dart';

class Constance {
  final Complexity? complexityConst;
  final Affordability? affordabilityConst;

  Constance({this.complexityConst, this.affordabilityConst});
  String? get complexityText {
    switch (complexityConst) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        'Unknown';
        break;
    }
  }
  String? get affordabilityText {
    switch (affordabilityConst) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        'Unknown';
        break;
    }
  }
}

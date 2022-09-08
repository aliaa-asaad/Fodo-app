import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/on_boarding_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
          'assets/images/fodo.png',height: 200,width: 200,fit: BoxFit.fill,),
logoWidth: 200,
      backgroundColor:Theme.of(context).colorScheme.onSecondary,
      loaderColor: Theme.of(context).colorScheme.primary,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: OnBoarding(),
      durationInSeconds: 5,
    );
  }
}

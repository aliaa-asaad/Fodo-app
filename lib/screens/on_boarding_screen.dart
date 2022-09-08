import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/on_board_data.dart';

class OnBoarding extends StatelessWidget {
  List? data = [
    OnBoardData(
        description: 'Choose any recipe', image: 'assets/images/choose.jpg'),
    OnBoardData(description: 'Cook it', image: 'assets/images/cook_it.jpg'),
    OnBoardData(description: 'Bonne appétit', image: 'assets/images/bonne.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: data!
            .map((item) => Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage(
                          item.image,
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 200,),
                      Container(
                        height: 200,
                        width: 350,
                        alignment: Alignment.center,
                        child: Text(
                          item.description,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.8)),
                      ),
                      SizedBox(height: 230,),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20))),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.fromLTRB(50, 20, 50, 20))),
                          onPressed: () {
                            Navigator.of(context).pushNamed('tab');
                          },
                          child: Text('Get Started',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

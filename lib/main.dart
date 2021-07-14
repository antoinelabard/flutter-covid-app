import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/Constants.dart';
import 'package:flutter_covid_19_app/InfoScreen.dart';

import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: kBodyTextColor
          )
        )
      ),
      home: InfoScreen(),
    );
  }
}


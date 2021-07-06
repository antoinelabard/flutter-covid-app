import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: kBodyTextColor
          )
        )
      ),
      home: HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}


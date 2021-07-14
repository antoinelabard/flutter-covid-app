import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app/widgets/Counter.dart';
import 'package:flutter_covid_19_app/widgets/Header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Header(),
      Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color(0xffe5e5e5))),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/maps-and-flags.svg"),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: DropdownButton(
              value: 'Indonesia',
              isExpanded: true,
              underline: SizedBox(),
              // icon: SvgPicture.asset("assets/icons/dropdown.svg"),
              items: ['Indonesia', 'Bangladesh', 'United States', 'japan']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
            ))
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Cases update\n",
                    style: kTitleTextStyle,
                  ),
                  TextSpan(
                    text: "Newest cases on July 12",
                    style: TextStyle(color: kTitleTextColor),
                  ),
                ])),
                Spacer(),
                Text(
                  "See details",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Counter(
                    color: kInfectedColor,
                    number: 1324,
                    title: "Infected",
                  ),
                  Counter(
                    color: kDeathColor,
                    number: 87,
                    title: "Deaths",
                  ),
                  Counter(
                    color: kRecoverColor,
                    number: 98,
                    title: "Recovered",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Spread of virus",
                  style: kTitleTextStyle,
                ),
                Text(
                  "See details",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Container(
              height: 178,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: kShadowColor)
                  ]),
              child: Image.asset("assets/images/map.png", fit: BoxFit.contain,),
            )
          ],
        ),
      ),
    ]));
  }
}
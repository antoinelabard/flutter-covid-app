import 'package:flutter/material.dart';
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
      ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff3383cd),
                    Color(0xff11249f),
                  ]),
              image: DecorationImage(
                  image: AssetImage("assets/images/virus.png"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset("assets/icons/menu.svg")),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/images/Drcorona.png",
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                      top: 20,
                      left: 150,
                      child: Text(
                        'All you need is\nto stay at home.',
                        style: kHeadingTextStyle.copyWith(color: Colors.white),
                      )),
                  Container()
                ],
              ))
            ],
          ),
        ),
      ),
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
                      shadows: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 30,
                            color: kShadowColor)
                      ]),
                )
              ],
            ),
            Container(
              height: 178,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Image.asset("assets/images/map.png"),
            )
          ],
        ),
      ),
    ]));
  }
}

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  Counter({
    Key? key,
    this.number = 0,
    this.color = Colors.black,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: color, width: 2)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(number.toString(), style: TextStyle(fontSize: 40, color: color)),
        Text(
          title,
          style: kSubTextStyle,
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

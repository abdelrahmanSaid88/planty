import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import 'my_theme_data.dart';

class CoustomButtonsSocal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        FloatingActionButton(
          heroTag: "btn1",
          mini: true,
          onPressed: () {},
          child: Image.asset("assets/images/ic_google.png"),
          // SvgPicture.asset("assets/images/ic_google.svg"),
          backgroundColor: MyThemeData.White,
          elevation: 15,
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          heroTag: "btn2",
          mini: true,
          onPressed: () {},
          child: SvgPicture.asset("assets/images/ic_facebook.svg"),
          backgroundColor: MyThemeData.White,
          elevation: 15,
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          mini: true,
          heroTag: "btn3",
          onPressed: () {

          },
          child: SvgPicture.asset("assets/images/ic_twitter.svg"),
          backgroundColor: MyThemeData.White,
          elevation: 15,
        ),
      ],
    );
  }
}
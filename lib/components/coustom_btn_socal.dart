import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import 'my_theme_colors.dart';

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
          child: SvgPicture.asset("assets/images/ic_google.svg"),
          // SvgPicture.asset("assets/images/ic_google.svg"),
          backgroundColor: MyThemeColors.white,
          elevation: 15,
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          heroTag: "btn2",
          mini: true,
          onPressed: () {},
          child: SvgPicture.asset("assets/images/ic_facebook.svg"),
          backgroundColor: MyThemeColors.white,
          elevation: 15,
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          mini: true,
          heroTag: "btn3",
          onPressed: () {

          },
          child: SvgPicture.asset("assets/images/ic_twitter.svg"),
          backgroundColor: MyThemeColors.white,
          elevation: 15,
        ),
      ],
    );
  }
}
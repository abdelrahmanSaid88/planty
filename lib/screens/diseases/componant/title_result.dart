import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/my_theme_colors.dart';

class TitleResult extends StatelessWidget {
  // const TitleResult({
  //   Key? key,
  // }) : super(key: key);
  String? titleIcon;
  String? title;

  TitleResult({this.title,this.titleIcon});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('$titleIcon'),
        ),
        const SizedBox(width: 7),
        Text('$title',
            style: GoogleFonts.robotoSlab(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: MyThemeColors.black)),
      ],
    );
  }
}
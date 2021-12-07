import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/my_theme_colors.dart';
import 'package:planty/screens/Home/components/add_button.dart';

class SectionTitle extends StatelessWidget {
  String? sectionTitle;
  Function? press;

  SectionTitle({this.sectionTitle, this.press});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionTitle!,
            style: GoogleFonts.poorStory(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                color: MyThemeColors.darkGreen),
          ),
          AddButton(press)
        ],
      ),
    );
  }
}
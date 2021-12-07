import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/my_theme_colors.dart';

class InformationText extends StatelessWidget {

  String? plantName;
  String? plantInfo;

  InformationText(this.plantName, this.plantInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 301,
      width: 428,
      //  margin: const EdgeInsets.only(top: 17.0),
      child: Card(
        color: MyThemeColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text('$plantName',
                style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: MyThemeColors.darkGreen)),
            const SizedBox(height: 20),
            Text('$plantInfo',
                style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: MyThemeColors.black)),
          ],
        ),
      ),
    );
  }
}
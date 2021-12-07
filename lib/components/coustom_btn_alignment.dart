import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../my_theme_colors.dart';

class CoustomButtonAlignment extends StatelessWidget {


  final String? Btn_text;
  final IconData? Btn_icon;
  final Function? press;
  const CoustomButtonAlignment(this.Btn_text,this.press, {this.Btn_icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 50.0,
      padding: const EdgeInsets.only(right: 35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment(-0.95, 0.0),
          end: Alignment(1.0, 0.0),
          colors: [
            Color.fromARGB(255, 18, 66, 60),
            Color.fromARGB(255, 87, 169, 154)
          ],
          stops: [0.0, 1.0],
        ),
      ),
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: press as void Function(),
        label: Text(Btn_text!,
            style: GoogleFonts.robotoSlab(
                fontWeight: FontWeight.bold,
                fontSize: 16.5,
                color: MyThemeColors.white)),
        icon:  Icon(
          Btn_icon,
          color: Colors.white,
          size: 22.0,
        ),
      ),
    );
  }


}
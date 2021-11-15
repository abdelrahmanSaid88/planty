import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_data.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: MyThemeData.MainDarkGreen,
          padding:const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: MyThemeData.White,
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: MyThemeData.MainDarkGreen))),
             // Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

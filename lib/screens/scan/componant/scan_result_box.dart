import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/scan/componant/title_result.dart';

class ScanResultBox extends StatelessWidget {
  // const ScanResultBox({Key? key}) : super(key: key);
String? disease;
String? titleIcon;
String? title;

ScanResultBox({this.disease, this.titleIcon, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
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
            TitleResult(title:title ,titleIcon: titleIcon),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: Text('$disease',
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.5,
                      color: MyThemeColors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

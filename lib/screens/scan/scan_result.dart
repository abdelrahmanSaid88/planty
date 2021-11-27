import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/scan/componant/scan_result_box.dart';
import 'package:planty/screens/scan/componant/scen_menu.dart';

import 'componant/scan_menu_scroll.dart';

class ScanResult extends StatelessWidget {
  //const ScanResult({Key? key}) : super(key: key);
  static const routeName = 'Scan Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyThemeColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: MyThemeColors.mainDarkGreen,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: MyThemeColors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        title: Text('Scan Result', style: appBarStyle(MyThemeColors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Hadda Beetle',
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: MyThemeColors.black)),
              Text('Insect',
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: MyThemeColors.mainDarkGreen)),
              ScanMenuScroll(),
              ScanResultBox(
                titleIcon: 'assets/images/ic_plant_book.svg',
                title: 'Symptoms ',
                disease: '• Feeding damage between leaf veins.'
                    '\n'
                    '• Skeletonization of leaves.'
                    '\n'
                    '• Shallow holes on fruits.'
                    '\n'
                    '• Stunted growth.'
                    '\n'
                    '• Heavy defoliation.'
                    '\n'
                    '• Adult beetles are oval, dull orange with 28 black spots and short soft hairs on the back. ',
              ),
              const SizedBox(height: 60),
              ScanResultBox(
                  titleIcon: 'assets/images/ic_more_information.svg',
                  title: 'More Info. ',
                  disease: '• Scientific name: Epilachna vigintioctopunctata'
                      '\n'
                      '• Also found in: Cucumber, Pumpkin, Zucchini, Potato, Melon, Bitter Gourd. '),
              const SizedBox(height: 30),
              Center(
                child: Text('Your Crop doctor ',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: MyThemeColors.colorOff)),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

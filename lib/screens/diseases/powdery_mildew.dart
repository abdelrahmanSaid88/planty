import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/constants.dart';
import 'package:planty/my_theme_colors.dart';
import 'package:planty/screens/diseases/componant/scan_result_box.dart';
import 'package:planty/screens/diseases/componant/scen_menu.dart';
class powderyMildew extends StatelessWidget {
  //const ScanResult({Key? key}) : super(key: key);
  static const routeName = 'powdery Mildew';
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
        title: Text('Plant Disease', style: appBarStyle(MyThemeColors.white)),
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
              Text('powdery Mildew',
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: MyThemeColors.black)),
              Text('Fungus',
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: MyThemeColors.mainDarkGreen)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ScanMenu('assets/images/img_powder_i.png'),
                    ScanMenu('assets/images/img_powder_ii.png'),
                    ScanMenu('assets/images/img_powder_iii.png'),
                    ScanMenu('assets/images/img_powder_i.png'),
                  ],
                ),
              ),
              ScanResultBox(
                  titleIcon: 'assets/images/ic_plant_book.svg',
                  title: 'Symptoms ',
                  disease: DisPowdery),
              const SizedBox(height: 60),
              ScanResultBox(
                  titleIcon: 'assets/images/ic_more_information.svg',
                  title: 'More Info. ',
                  disease: DisPodweryMore),
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
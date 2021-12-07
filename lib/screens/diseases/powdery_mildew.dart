import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/components/my_theme_colors.dart';
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
                disease: '• Whitish spots on leaves, stems and sometimes fruits.'
                    '\n'
                    '• White covering on the upper side or underside of the leaves.'
                    '\n'
                    '• Stunted growth.'
                    '\n'
                    '• Leaves shrivel and fall off.'
                    '\n'
                    '•The infection usually starts off as circular, powdery white spots which can affect leaves, stems and sometimes fruits. It usually covers he upper parts of the leaves but may grow on the undersides as well. The fungus hinders photosynthesis and causes the Leaves turn yellow and dry out and some leaves might twist, break or become disfigured. In the later stages, the buds and growing tips become disfigured.',
              ),
              const SizedBox(height: 60),
              ScanResultBox(
                  titleIcon: 'assets/images/ic_more_information.svg',
                  title: 'More Info. ',
                  disease: '• Scientific name: Erysiphaceae'
                      '\n'
                      '• Also found in: Apple, Pear, Bean, Brinjal, Cherry, Peach, Pea, Pumpkin, Zucchini, Tomato, Cabbage, Potato, Black & Green Gram, Pigeon Pea & Red Gram, Chickpea & Gram, Cotton, Other, Onion, Sorghum, Maize, Okra, Citrus, Peanut, Cassava, Sugarcane, Melon, Canola, Lentil, Ornamental, Bitter Gourd. '),
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

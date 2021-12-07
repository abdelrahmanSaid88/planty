import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/my_theme_colors.dart';
import 'package:planty/screens/diseases/componant/scan_result_box.dart';
import 'package:planty/screens/diseases/componant/scen_menu.dart';
class Rust extends StatelessWidget {
  //const ScanResult({Key? key}) : super(key: key);
  static const routeName = 'Rust';

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
        title: Text('Plant Disease ', style: appBarStyle(MyThemeColors.white)),
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
              Text('Rust',
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
                  ScanMenu('assets/images/img_rust_i.png'),
                  ScanMenu('assets/images/img_rust_ii.png'),
                  ScanMenu('assets/images/img_rust_iii.png'),
                  ScanMenu('assets/images/img_rust_i.png'),
                ],
              ),
            ),
              ScanResultBox(
                titleIcon: 'assets/images/ic_plant_book.svg',
                title: 'Symptoms ',
                disease:
                    '• Leaf rust is a disease that attacks garden plants in wet, humid conditions. It is common on roses, snapdragons, hollyhocks, crabapples, and daylilies. '
                    '\n'
                    '• Bright-orange-red, circular spots appear on the upper surface of leaves.'
                    '\n'
                    '• Brownish and gall-like outgrowths develop on the underside of leaves.'
                    '\n'
                    '• Occasionally, sunken cankers in the bark of branches and young trunks.'
                    '\n'
                    '• Small, brown, circular spots develop first onto the upper surface of leaves. As they enlarge, they turn bright orange-red with a dark brown center. In late summer, grain-shaped, brownish and gall-like outgrowths can be observed on the underside of leaves. Occasionally, the fungus can also cause lesions and sunken cankers in the bark of branches and young trunks. Even though the fruits are not directly affected, a severe infection can cause defoliation and crop losses.'

              ),
              const SizedBox(height: 60),
              ScanResultBox(
                  titleIcon: 'assets/images/ic_more_information.svg',
                  title: 'More Info. ',
                  disease: '• Scientific name: Basidiomycota'
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

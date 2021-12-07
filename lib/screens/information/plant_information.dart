import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/components/coustom_btn_alignment.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/constants.dart';
import 'package:planty/screens/information/components/add_plant_button.dart';
import 'package:planty/screens/information/components/information_image.dart';
import 'package:planty/screens/information/components/information_text.dart';
import 'package:planty/screens/information/components/plant_scroll_information.dart';
import 'package:planty/screens/information/components/take_care_box.dart';

class PlantInformation extends StatelessWidget {
  //const PlantInformation({Key? key}) : super(key: key);
  static final routeName = 'Plant Information';

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
        title: Text('Plants Information',
            style: appBarStyle(MyThemeColors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const InformationImage(),
            const SizedBox(height: 35),
            const PlantScrollInformation(),
            const SizedBox(height: 35),
            InformationText('Tomatoes', kInfMsg),
            const TakeCare(),
            const SizedBox(height: 15),
            AddPlantButton(_addPlant, 'Add PLant'),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}



void _addPlant() {}

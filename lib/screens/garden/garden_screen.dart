import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/garden/componant/garden_menus.dart';
import 'package:planty/screens/information/plant_information.dart';

class GardenScreen extends StatefulWidget {
 // const GardenScreen({Key? key}) : super(key: key);
  static const routeName = 'Garden Screen';

  @override
  State<GardenScreen> createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {
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
          title: Text('Planty',
              style:appBarStyle(MyThemeColors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GardenMenus(true, _viewDetiels,
                  plantImage: ('assets/images/img_tomatoes.png'),
                  plantName: 'Tomatoes',
                  date: '3hr 4min'),
              GardenMenus(false, _viewDetiels,
                  plantImage: ('assets/images/img_carrot.png'),
                  plantName: 'Carrot',
                  date: '2 days'),
              GardenMenus(true, _viewDetiels,
                  plantImage: ('assets/images/img_tomatoes.png'),
                  plantName: 'Tomatoes',
                  date: '3hr 4min'),
              GardenMenus(false, _viewDetiels,
                  plantImage: ('assets/images/img_carrot.png'),
                  plantName: 'Carrot',
                  date: '2 days'),
              GardenMenus(true, _viewDetiels,
                  plantImage: ('assets/images/img_tomatoes.png'),
                  plantName: 'Tomatoes',
                  date: '3hr 4min'),
            ],
          ),
        ));
  }

  void _viewDetiels() {
    Navigator.pushNamed(context, PlantInformation.routeName);
  }
}

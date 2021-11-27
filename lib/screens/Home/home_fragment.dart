import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/Home/components/add_plant_widget.dart';
import 'package:planty/screens/Home/components/calender_table.dart';
import 'package:planty/screens/Home/components/home_menus.dart';
import 'package:planty/screens/Home/components/recent_photos_menu.dart';
import 'package:planty/screens/Home/components/section_title.dart';
import 'package:planty/screens/garden/garden_screen.dart';

class HomeFragment extends StatefulWidget {
  //const HomeFragment({Key? key}) : super(key: key);
  static const routeName = 'Home Fragment';

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyThemeColors.backgroundColor,
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: MyThemeColors.white,
          leading: IconButton(
              icon: Icon(Icons.search_rounded,
                  size: 30, color: MyThemeColors.darkGreen),
              onPressed: () {}),
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          title:
              Text('Planty', style: appBarStyle(MyThemeColors.mainDarkGreen)),
          actions: [
            IconButton(
                icon: Icon(Icons.notifications,
                    size: 30, color: MyThemeColors.darkGreen),
                onPressed: () {}),
          ],
          centerTitle: true,
          elevation: 10.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CalenderTable(),
              const SizedBox(height: 40),
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SectionTitle(sectionTitle: 'My Garden', press: _addPlant),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HomeMenus(true, _viewDetiels,
                              plantImage: ('assets/images/img_tomatoes.png'),
                              plantName: 'Tomatoes',
                              date: '3hr 4min'),
                          HomeMenus(false, _viewDetiels,
                              plantImage: ('assets/images/img_carrot.png'),
                              plantName: 'Carrot',
                              date: '2 days'),
                          HomeMenus(true, _viewDetiels,
                              plantImage: ('assets/images/img_tomatoes.png'),
                              plantName: 'Tomatoes',
                              date: '3hr 4min'),
                          HomeMenus(false, _viewDetiels,
                              plantImage: ('assets/images/img_carrot.png'),
                              plantName: 'Carrot',
                              date: '2 days'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        'Recent Photos',
                        style: GoogleFonts.poorStory(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: MyThemeColors.darkGreen),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          RecentPhotosMenu(
                              recentImage: ('assets/images/img_tomatoes.png')),
                          RecentPhotosMenu(
                              recentImage: ('assets/images/img_tomatoes.png')),
                          RecentPhotosMenu(
                              recentImage: ('assets/images/img_tomatoes.png')),
                          RecentPhotosMenu(
                              recentImage: ('assets/images/img_tomatoes.png')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addPlant() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return AddPlantWidget();
        });
  }

  void _viewDetiels() {
    Navigator.pushNamed(context, GardenScreen.routeName);
  }
}


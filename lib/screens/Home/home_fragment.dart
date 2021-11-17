import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_colors.dart';

class HomeFragment extends StatefulWidget {
  // const HomeFragment({Key? key}) : super(key: key);
  static const routeName = 'Home Fragment';
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: MyThemeColors.white,
        leading: IconButton(
            icon: Icon(Icons.search_rounded,
                size: 30, color: MyThemeColors.darkGreen),
            onPressed: (){} ),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        title: Text('Planty',
            style: GoogleFonts.poorStory(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: MyThemeColors.mainDarkGreen)),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications,
                  size: 30, color: MyThemeColors.darkGreen),
              onPressed: (){}),
        ],
        centerTitle: true,
        elevation: 10.0,
      ),

    );
  }
}

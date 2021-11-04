// ignore_for_file: prefer_const_declarations, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../main.dart';
class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  static final routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: MyThemeData.White,
        leading: IconButton(
            icon: Icon(Icons.search_rounded, size: 30, color: MyThemeData.DarkGreen),
            onPressed: OnNotification ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
        title:
        Text('Planty',
            style: GoogleFonts.poorStory(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: MyThemeData.MainDarkGreen)),
        actions: [
          IconButton(
              icon: Icon(Icons.notification_important,
                  size: 30, color: MyThemeData.DarkGreen),
              onPressed: OnNotification),
        ],
        centerTitle: true,
        elevation: 30.0,
      ),
    );

  }





  void OnNotification() {
    print('notifi here');
  }
}

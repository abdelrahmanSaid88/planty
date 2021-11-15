import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_data.dart';
import 'package:planty/screens/Profile/profile_menu.dart';
import 'package:planty/screens/Profile/profile_picture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'Profile Screen';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: MyThemeData.White),
          child: Image.asset(
            'assets/images/profile_bg.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const ProfilePicture(),
                 const SizedBox(height: 20),
                  Text('Abdelrahman Said',
                      style: GoogleFonts.kalam(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: MyThemeData.MainDarkGreen)),
                  const SizedBox(height: 50),
                  ProfileMenu(
                    text: 'Notification',
                    icon: "assets/images/ic_notification.svg",
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: 'Settings',
                    icon: "assets/images/ic_settings.svg",
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: 'Help',
                    icon: "assets/images/ic_help.svg",
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: 'Log Out',
                    icon: "assets/images/ic_logout.svg",
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: 'Feedback',
                    icon: "assets/images/ic_feedback.svg",
                    press: () => {},
                  ),
                ],
              ),
          ),
        ),
      ],
    );
  }
}
/*
SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 30),
          ProfilePic(),
          SizedBox(height: 20),
        ],
      ),
    );
 */

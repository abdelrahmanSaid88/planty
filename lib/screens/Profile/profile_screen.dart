
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/Profile/profile_menu.dart';
import 'package:planty/screens/Profile/profile_picture.dart';
import 'package:planty/screens/Registration/sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'Profile Screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: MyThemeColors.white),
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
                          color: MyThemeColors.mainDarkGreen)),
                  const SizedBox(height: 50),
                  ProfileMenu(
                    text: 'Notification',
                    icon: 'assets/images/ic_notification.svg',
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
                    press: () => {
                      logOutClick()
                    },
                  ),
                  ProfileMenu(
                    text: 'Feedback',
                    icon: "assets/images/ic_feedback.svg",
                    press: () => {
                    },
                  ),
                ],
              ),
          ),
        ),
      ],
    );

  }

  void logOutClick()async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, SignIn.routeName);
  }
}


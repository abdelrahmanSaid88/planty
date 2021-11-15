import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:planty/components/build_password_form_field.dart';
import 'package:planty/components/coustom_btn_alignment.dart';
import 'package:planty/components/coustom_btn_socal.dart';
import 'package:planty/components/build_email_form_field.dart';
import 'package:planty/components/my_theme_data.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Registration/sign_up.dart';
import '../../constants.dart';

class SignIn extends StatefulWidget {
  static const routeName = 'Sign In';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: MyThemeData.White),
          child: Image.asset(
            'assets/images/login_bg.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    key: _registrationFormKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        Text('Welcome To Planty App',
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: MyThemeData.Black)),
                        //Email
                        buildEmailFormField('Email Address', kEmailNullError,
                            icon: Icons.email),
                        buildPasswordFormField(password: 'password'),
                        const SizedBox(height: 15),
                        CoustomButtonAlignment('LOGIN', onClick,
                            Btn_icon: Icons.arrow_forward),
                        const SizedBox(height: 20),
                        //Sign in with
                        Text(
                            'ـــــــــــــــــــــــــ  Sign in with  ــــــــــــــــــــــــــــ',
                            style: GoogleFonts.andada(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: MyThemeData.MainDarkGreen)),
                        //sign in with Buttons
                        CoustomButtonsSocal(),
                        // Register Now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account?',
                                style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: MyThemeData.Black)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignUp.routeName);
                                },
                                child: Text(' Register Now',
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: MyThemeData.MainDarkGreen))),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onClick() async {
    if (_registrationFormKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}

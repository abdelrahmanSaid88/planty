import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/build_password_form_field.dart';
import 'package:planty/components/build_username_form_field.dart';
import 'package:planty/components/coustom_btn_alignment.dart';
import 'package:planty/components/coustom_btn_socal.dart';
import 'package:planty/components/build_email_form_field.dart';
import 'package:planty/components/my_theme_data.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Registration/sign_in.dart';
import '../../constants.dart';

class SignUp extends StatefulWidget {
//const SignUp({Key? key}) : super(key: key);
  static const routeName = 'Sign Up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: MyThemeData.White),
          child: Image.asset(
            'assets/images/signin_bg.png',
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
                const SizedBox(height: 100),
                Form(
                    key: _registrationFormKey,
                    child: Column(
                      children: [
                        Text('Create New Account...',
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: MyThemeData.Black)),
                        buildUserNameFormField('UserName',kNamelNullError),
                        buildEmailFormField(
                            'Email address', kEmailNullError),
                        const buildPasswordFormField(password: 'Password'),
                        const SizedBox(height: 14),
                        CoustomButtonAlignment('SIGN UP', onClick),
                        const SizedBox(height: 18),
                        //Sign in with
                        Text(
                            'ـــــــــــــــــــــــــ  Or Use Social Media.!!  ــــــــــــــــــــــــــــ',
                            style: GoogleFonts.andada(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: MyThemeData.MainDarkGreen)),
                        //sign in with Buttons
                        CoustomButtonsSocal(),
                        // Register Now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an Account ?',
                                style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: MyThemeData.Black)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignIn.routeName);
                                },
                                child: Text(' SIGN IN',
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: MyThemeData.DarkGreen))),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onClick() async {
    if (_registrationFormKey.currentState!.validate()) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}

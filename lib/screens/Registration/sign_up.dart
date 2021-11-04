import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/coustom_btn_alignment.dart';
import 'package:planty/components/coustom_btn_socal.dart';
import 'package:planty/components/coustom_textForm.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Registration/sign_in.dart';
import '../../main.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/img_bottom_signup_bg.png"),

            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/img_signup.png'),
              Text('Create New Account...',
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: MyThemeData.Black)),
              CoustomTextFeildFrom(userNameController, 'Username'),
              CoustomTextFeildFrom(userNameController, 'Email address'),
              CoustomTextFeildFrom(userNameController, 'Password'),
              const SizedBox(height: 14),
              CoustomButtonAlignment('SIGN UP', onClick ),
              const SizedBox(height: 18),
              //Sign in with
              Text(
                  'ـــــــــــــــــــــــــ  Or Use Social Media.!!  ــــــــــــــــــــــــــــ',
                  style: GoogleFonts.andada(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: MyThemeData.MainDarkGreen)),
              //sign in with Buttons
              const CoustomButtonsSocal(),
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
                        Navigator.pushNamed(context, SignIn.routeName);
                      },
                      child: Text(' SIGN IN',
                          style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: MyThemeData.DarkGreen))),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  void onClick() async {
    print(emailController);
    print(passwordController);
    Navigator.pushNamed(context, HomeScreen.routeName);
  }
}

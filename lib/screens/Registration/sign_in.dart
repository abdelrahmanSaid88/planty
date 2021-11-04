import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:planty/components/coustom_btn_alignment.dart';
import 'package:planty/components/coustom_btn_socal.dart';
import 'package:planty/components/coustom_textForm.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Registration/sign_up.dart';
import '../../main.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key? key}) : super(key: key);
  static const routeName = 'Sign In';
  @override
  _SignInState createState() => _SignInState();

}

class _SignInState extends State<SignIn> {
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
              image: AssetImage("assets/images/img_bottom_bg.png"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Image.asset('assets/images/img_login.png'),

              Text('Welcome To Planty App',
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: MyThemeData.Black)),
              //Email
              CoustomTextFeildFrom(emailController,  'Email Address',TF_icon: Icons.email),
              CoustomTextFeildFrom(passwordController, 'Password',TF_icon: Icons.visibility),
              const SizedBox(height: 15),
              CoustomButtonAlignment('LOGIN', onClick ,Btn_icon: Icons.arrow_forward),
              const SizedBox(height: 20),
              //Sign in with
              Text(
                  'ـــــــــــــــــــــــــ  Sign in with  ــــــــــــــــــــــــــــ',
                  style: GoogleFonts.andada(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: MyThemeData.MainDarkGreen)),
              //sign in with Buttons
              const CoustomButtonsSocal(),
              // Register Now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\’t have an account?',
                      style: GoogleFonts.robotoSlab(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: MyThemeData.Black)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUp.routeName);
                      },
                      child: Text(' Register Now',
                          style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: MyThemeData.MainDarkGreen))),
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




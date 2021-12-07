import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planty/components/build_password_form_field.dart';
import 'package:planty/components/coustom_btn_alignment.dart';
import 'package:planty/components/coustom_btn_socal.dart';
import 'package:planty/components/build_email_form_field.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Profile/profile_screen.dart';
import 'package:planty/screens/Registration/sign_up.dart';
import '../../constants.dart';

class SignIn extends StatefulWidget {
  static const routeName = 'Sign In';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _registrationFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: MyThemeColors.white),
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
                                color: MyThemeColors.black)),
                        //Email
                        buildEmailFormField(
                            emailController, 'Email Address', kEmailNullError,
                            icon: Icons.email),
                        buildPasswordFormField(passwordController,
                            password: 'password'),
                        const SizedBox(height: 15),
                        CoustomButtonAlignment('LOGIN', createFirebaseUser,
                            Btn_icon: Icons.arrow_forward),
                        const SizedBox(height: 20),
                        //Sign in with
                        Text(
                            'ـــــــــــــــــــــــــ  Sign in with  ــــــــــــــــــــــــــــ',
                            style: GoogleFonts.andada(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: MyThemeColors.mainDarkGreen)),
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
                                    color: MyThemeColors.black)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignUp.routeName);
                                },
                                child: Text(' Register Now',
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: MyThemeColors.mainDarkGreen))),
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

  bool isLoading = false;

  void createFirebaseUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user == null) {
        showErrorMessage(kUserError);
      } else {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.message ?? '');
    } catch (e) {
      //showErrorMessage(e.toString() ?? '');
    }
    setState(() {
      isLoading = false;
    });
  }

  void showErrorMessage(String error) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            backgroundColor: MyThemeColors.white,
            content: Text(error, style: TextStyle(color: MyThemeColors.black)),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

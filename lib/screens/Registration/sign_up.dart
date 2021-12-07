import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/build_password_form_field.dart';
import 'package:planty/components/build_username_form_field.dart';
import 'package:planty/components/coustom_btn_alignment.dart';
import 'package:planty/components/coustom_btn_socal.dart';
import 'package:planty/components/build_email_form_field.dart';
import 'package:planty/my_theme_colors.dart';
import 'package:planty/screens/Registration/model/app_provider.dart';
import 'package:planty/screens/Registration/model/helper_database.dart';
import 'package:planty/screens/Registration/model/user_model.dart';
import 'package:planty/screens/Registration/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
//const SignUp({Key? key}) : super(key: key);
  static const routeName = 'Sign Up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final _registrationFormKey = GlobalKey<FormState>();
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: MyThemeColors.white),
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
                                color: MyThemeColors.black)),
                        BuildUserNameFormField(
                            userNameController, 'User Name', kNamelNullError),
                        buildEmailFormField(
                            emailController, 'Email address', kEmailNullError),
                        buildPasswordFormField(passwordController,
                            password: 'Password'),
                        const SizedBox(height: 14),
                        CoustomButtonAlignment('SIGN UP', createAccount ),
                        const SizedBox(height: 18),
                        //Sign in with
                        Text(
                            'ـــــــــــــــــــــــــ  Or Use Social Media.!!  ــــــــــــــــــــــــــــ',
                            style: GoogleFonts.andada(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: MyThemeColors.mainDarkGreen)),
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
                                    color: MyThemeColors.black)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignIn.routeName);
                                },
                                child: Text(' SIGN IN',
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: MyThemeColors.darkGreen))),
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

  final db = FirebaseFirestore.instance;
  bool isLoading = false;

  void createAccount() {
    if (_registrationFormKey.currentState?.validate() == true) {
      createFirebaseUser();
    }
  }

  void createFirebaseUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      final userCollectionRef = getUserCollectionsWithConvert();

      final user = UserModel(
          id: userCredential.user!.uid,
          userName: userNameController.text,
          emailAddress: emailController.text);
      userCollectionRef.doc(user.id).set(user).then((value) {
        provider.updateUser(user);
        // Navigator.pushNamed(context, SignIn.routeName);
        Navigator.pushReplacementNamed(context,SignIn.routeName);
      });
      if (userCredential.user == null) {
        showErrorMessage(kUserError);
      } else {
      Navigator.pushReplacementNamed(context,SignIn.routeName);
      }
    } on FirebaseAuthException catch (e) {
        showErrorMessage(e.message ?? kMessegeError);
    } catch (e) {
      print(e);
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

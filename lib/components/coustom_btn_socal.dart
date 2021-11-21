import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planty/components/google_service.dart';
import 'package:planty/screens/Home/home_screen.dart';

import 'my_theme_colors.dart';

class CoustomButtonsSocal extends StatefulWidget {
  @override
  State<CoustomButtonsSocal> createState() => _CoustomButtonsSocalState();

}

class _CoustomButtonsSocalState extends State<CoustomButtonsSocal> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 bool isLoading = false;

  @override

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: "btn1",
          mini: true,
          onPressed: () {
            SignInWithGoogle();
          },
          child: SvgPicture.asset("assets/images/ic_google.svg"),
          // SvgPicture.asset("assets/images/ic_google.svg"),
          backgroundColor: MyThemeColors.white,
          elevation: 15,
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          heroTag: "btn2",
          mini: true,
          onPressed: () {
            signInWithFacebook();
          },
          child: SvgPicture.asset("assets/images/ic_facebook.svg"),
          backgroundColor: MyThemeColors.white,
          elevation: 15,
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          mini: true,
          heroTag: "btn3",
          onPressed: () {},
          child: SvgPicture.asset("assets/images/ic_twitter.svg"),
          backgroundColor: MyThemeColors.white,
          elevation: 15,
        ),
      ],
    );
  }

  void SignInWithGoogle()async{
    setState(() {
      isLoading = true;
    });
     FirebaseService service = new FirebaseService();
    try {
      await service.signInWithGoogle();
      Navigator.pushNamedAndRemoveUntil(context,HomeScreen.routeName, (route) => true);
    } catch(e){
      if(e is FirebaseAuthException){
        showMessage(e.message!);
      }
    }
    setState(() {
      isLoading = false;
    });
  }
  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }



  Future<Resource?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential = await _auth.signInWithCredential(facebookCredential);
          return Resource(status: Status.Success);
        case LoginStatus.cancelled:
          return Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          return Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

}
class Resource{
  final Status status;
  Resource({required this.status});
}
enum Status {
  Success,
  Error,
  Cancelled
}


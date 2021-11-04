import 'package:flutter/material.dart';
import 'package:planty/routes.dart';

import 'package:planty/screens/Registration/sign_in.dart';



class MyThemeData {
  static var MainDarkGreen =const Color.fromRGBO(87, 169, 154, 1.0);
  static var DarkGreen =const Color.fromRGBO(60, 112, 102, 1.0);
  static var BackgroundColor =const Color.fromRGBO(239, 240, 241, 1.0);
  static var Black = const Color.fromRGBO(0, 0, 0, 1.0);
  static var White = const Color.fromRGBO(255, 255, 255, 1.0);
}
void main() {
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignIn.routeName,
      routes: routes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planty/routes.dart';

import 'package:planty/screens/Registration/sign_in.dart';

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

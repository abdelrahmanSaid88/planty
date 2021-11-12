import 'package:flutter/material.dart';
import 'package:planty/routes.dart';

import 'package:planty/screens/Registration/sign_in.dart';

void main() {
  runApp( const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignIn.routeName,
      routes: routes,
    );
  }
}

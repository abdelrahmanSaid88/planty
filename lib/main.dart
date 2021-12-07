import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planty/machineLearning/scan_result.dart';
import 'package:planty/routes.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Profile/profile_screen.dart';

import 'package:planty/screens/Registration/sign_in.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}

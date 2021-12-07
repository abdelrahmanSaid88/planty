import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planty/routes.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Profile/profile_screen.dart';
import 'package:planty/screens/Registration/model/app_provider.dart';

import 'package:planty/screens/Registration/sign_in.dart';
import 'package:provider/provider.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   FirebaseFirestore.instance.disableNetwork();
  runApp( const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=>AppProvider(),
      builder:(context,widget){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SignIn.routeName,
          routes: routes,
        );
      }
    );
  }
}

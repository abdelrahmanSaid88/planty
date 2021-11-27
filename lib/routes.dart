
import 'package:flutter/cupertino.dart';
import 'package:planty/screens/Home/home_fragment.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Profile/profile_screen.dart';
import 'package:planty/screens/Registration/sign_in.dart';
import 'package:planty/screens/Registration/sign_up.dart';
import 'package:planty/screens/garden/garden_screen.dart';
import 'package:planty/screens/information/plant_information.dart';
import 'package:planty/screens/scan/scan_result.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  HomeFragment.routeName: (context) => HomeFragment(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ScanResult.routeName:(context)=>ScanResult(),
  GardenScreen.routeName: (context) => GardenScreen(),
  PlantInformation.routeName: (context) => PlantInformation(),
};

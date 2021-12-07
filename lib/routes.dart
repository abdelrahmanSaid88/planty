
import 'package:flutter/cupertino.dart';
import 'package:planty/machineLearning/components/radio_button.dart';
import 'package:planty/machineLearning/scan_result.dart';
import 'package:planty/screens/Home/home_fragment.dart';
import 'package:planty/screens/Home/home_screen.dart';
import 'package:planty/screens/Profile/profile_screen.dart';
import 'package:planty/screens/Registration/sign_in.dart';
import 'package:planty/screens/Registration/sign_up.dart';
import 'package:planty/screens/diseases/early_blight.dart';
import 'package:planty/screens/diseases/powdery_mildew.dart';
import 'package:planty/screens/diseases/rust.dart';
import 'package:planty/screens/garden/garden_screen.dart';
import 'package:planty/screens/information/plant_information.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  HomeFragment.routeName: (context) => HomeFragment(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Rust.routeName:(context)=>Rust(),
  GardenScreen.routeName: (context) => GardenScreen(),
  PlantInformation.routeName: (context) => PlantInformation(),
  scanResult.routeName: (context) => scanResult(),
  RadioButton.routeName: (context) => RadioButton(),
  powderyMildew.routeName: (context) => powderyMildew(),
  earlyBlight.routeName: (context) => earlyBlight(),
};

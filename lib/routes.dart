import 'package:flutter/cupertino.dart';
import 'package:planty/screens/Registration/sign_in.dart';
import 'package:planty/screens/Registration/sign_up.dart';
import 'package:planty/screens/Home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
HomeScreen.routeName: (context) => HomeScreen(),
SignIn.routeName: (context) => SignIn(),
SignUp.routeName: (context) => SignUp(),

};
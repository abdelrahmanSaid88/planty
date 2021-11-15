import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'my_theme_data.dart';

class buildUserNameFormField extends StatelessWidget{

  var emailController = TextEditingController();
   String? username;
   String? error;
   IconData? icon;
  final _registrationFormKey = GlobalKey<FormState>();
  buildUserNameFormField( this.username,this.error, { this.icon}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
      child: TextFormField(
        key: _registrationFormKey,
        onSaved: (newValue) => username = newValue,
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          print(value);
        },
        controller: emailController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            labelText: username,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: MyThemeData.MainDarkGreen,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIcon: Icon(
              icon,
              size: 25,
              color: MyThemeData.MainDarkGreen,
            )),
      ),
    );
  }}

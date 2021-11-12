import 'package:flutter/material.dart';

import '../constants.dart';
import 'my_theme_data.dart';

class buildEmailFormField extends StatelessWidget{

  var emailController = TextEditingController();
   String? email;
   String? error;
   IconData? icon;
  final _registrationFormKey = GlobalKey<FormState>();
  buildEmailFormField( this.email,this.error, { this.icon}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
      child: TextFormField(
        key: _registrationFormKey,
        onSaved: (newValue) => email = newValue,
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            return kInvalidEmailError;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          print(value);
        },
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: email,
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
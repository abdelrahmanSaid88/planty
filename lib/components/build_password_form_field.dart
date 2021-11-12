import 'package:flutter/material.dart';

import '../constants.dart';
import 'my_theme_data.dart';

class buildPasswordFormField extends StatelessWidget {
//  const BuildPasswordFormField({Key? key}) : super(key: key);
  String? password;
  IconData? icon;
  final _registrationFormKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  buildPasswordFormField(this.password, {this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
      child: TextFormField(
        key: _registrationFormKey,
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        validator: (value) {
          if (value!.isEmpty) {
            return kPassNullError;
          } else if (value.length < 8) {
            return kShortPassError;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          print(value);
        },
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            labelText: password,
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
  }
}

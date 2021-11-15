import 'package:flutter/material.dart';

import '../constants.dart';
import 'my_theme_data.dart';

class buildPasswordFormField extends StatefulWidget {
 //const BuildPasswordFormField({Key? key}) : super(key: key);
 final String? password;
  final IconData? icon;
  const buildPasswordFormField( {this.password,this.icon});

  @override
  State<buildPasswordFormField> createState() => _buildPasswordFormFieldState(password:this.password,icon: this.icon);
}

class _buildPasswordFormFieldState extends State<buildPasswordFormField> {
  final _registrationFormKey = GlobalKey<FormState>();
  String? password;
  IconData? icon;
  bool isHiddenPassword =true;
  var passwordController = TextEditingController();
  _buildPasswordFormFieldState({this.password, this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
      child: TextFormField(
        key: _registrationFormKey,
        obscureText: isHiddenPassword,
        onSaved: (newValue) => password = newValue!,
        validator: (value) {
          if (value!.isEmpty) {
            return kPassNullError;
          } else if (value.length < 6) {
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
            suffixIcon: InkWell(
              onTap: _togglePasswordView,
              child: Icon(
                isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                semanticLabel: isHiddenPassword ? kHidePass : kShowPass,
                size: 25,
                color: MyThemeData.MainDarkGreen,
              ),
            )),
      ),
    );
  }

  void _togglePasswordView() {
    setState((){
      isHiddenPassword = !isHiddenPassword;
    });
  }
}



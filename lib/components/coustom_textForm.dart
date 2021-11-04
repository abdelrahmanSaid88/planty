import 'package:flutter/material.dart';

import '../main.dart';

class CoustomTextFeildFrom extends StatelessWidget{

  final TextEditingController textEditController;
  final String TF_text;
  final IconData TF_icon;

  const CoustomTextFeildFrom(this.textEditController, this.TF_text, { this.TF_icon}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 45.0, right: 45.0),
        child: TextFormField(
          controller: textEditController,
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (value) {
            print(value);
          },
          decoration: InputDecoration(
              labelText:TF_text,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: MyThemeData.MainDarkGreen,
              ),
              suffixIcon: Icon(TF_icon,
                size: 25,
                color: MyThemeData.MainDarkGreen,
              )),
        ));
  }
}

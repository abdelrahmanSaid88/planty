import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planty/my_theme_colors.dart';
import 'package:planty/screens/information/plant_information.dart';

class RadioButton extends StatefulWidget {
  static const routeName = 'RadioButton';
  int? position = 0;
  RadioButton({this.position,});

  @override
  State<RadioButton> createState() => _RadioButtonState(val: position);
}

class _RadioButtonState extends State<RadioButton> {
  int? val = 0;
  _RadioButtonState({this.val,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Column(
        children: [
          RadioListTile(
            title: const Text(
              ' Powdery Mildew',
              style: TextStyle(color: Colors.black),
            ),
            value: 1,
            groupValue: val,
            onChanged: (value) => setState(() {
              val = value as int?;
            }),
          ),
          RadioListTile(
            title: const Text(
              ' Early blight',
              style: TextStyle(color: Colors.black),
            ),
            value: 2,
            groupValue: val,
            onChanged: (value) => setState(() {
              val = value as int?;
            }),
          ),
          RadioListTile(
            title: const Text(
              ' Rust',
              style: TextStyle(color: Colors.black),
            ),
            value: 3,
            groupValue: val,
            onChanged: (value) => setState(() {
              val = value as int?;
            }),
          ),
          FlatButton(
            onPressed: () {
              onButtonClick() ;
            },shape:const  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
            child: const Text(
              " More Details",
              style: TextStyle(color: Colors.white),
            ),
            color: MyThemeColors.mainDarkGreen,
          )
        ],
      ),
    );

  }

  onButtonClick() {
    if (val==1) Navigator.pushNamed(context, PlantInformation.routeName);
    if (val==2) Navigator.pushNamed(context,PlantInformation.routeName);
    if (val==3) Navigator.pushNamed(context,PlantInformation.routeName);

  }
}

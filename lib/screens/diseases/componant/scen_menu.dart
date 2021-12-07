import 'package:flutter/material.dart';
import 'package:planty/my_theme_colors.dart';

class ScanMenu extends StatelessWidget {
  //const ScanMenu({Key? key}) : super(key: key);
  String? plantImage;

  ScanMenu(this.plantImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 260,
      color: MyThemeColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Image.asset('$plantImage'),
          ],
        ),
      ),
    );
  }
}
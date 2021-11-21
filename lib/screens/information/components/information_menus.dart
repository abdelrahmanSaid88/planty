import 'package:flutter/material.dart';
import 'package:planty/components/my_theme_colors.dart';

class InformationMenus extends StatelessWidget {
 // const InformationMenus({Key? key}) : super(key: key);
  String? plantImage;

  InformationMenus(this.plantImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: MyThemeColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('$plantImage'),
          ],
        ),
      ),
    );
  }
}

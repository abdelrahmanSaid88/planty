import 'package:flutter/material.dart';
import 'package:planty/screens/information/components/information_menus.dart';

class PlantScrollInformation extends StatelessWidget {
  const PlantScrollInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InformationMenus('assets/images/img_test_tom.png'),
           const SizedBox(width: 15),
          InformationMenus('assets/images/img_tomatoes.png'),
          const SizedBox(width: 15),
          InformationMenus('assets/images/img_test_tom.png'),
           const SizedBox(width: 15),
          InformationMenus('assets/images/img_tomatoes.png'),
          const SizedBox(width: 15),
          InformationMenus('assets/images/img_test_tom.png'),
          const SizedBox(width:15),
          InformationMenus('assets/images/img_tomatoes.png'),
          const SizedBox(width: 15),
          InformationMenus('assets/images/img_test_tom.png'),
          const SizedBox(width: 15),
          InformationMenus('assets/images/img_tomatoes.png'),

        ],
      ),
    );
  }
}
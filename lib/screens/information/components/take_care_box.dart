import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/Home/components/section_title.dart';
import 'package:planty/screens/information/components/harvest_water.dart';

class TakeCare extends StatelessWidget {
  const TakeCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 428,
      //  margin: const EdgeInsets.only(top: 17.0),
      child: Card(
        color: MyThemeColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 17),
              Text(
                'To Take Care',
                style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: MyThemeColors.darkGreen),
              ),
              const SizedBox(height: 26),
              HarvestWater('assets/images/ic_water.svg',harvestOrWater: 'Watering in',date: '12hr 12mins'),
              const SizedBox(height: 26),
              HarvestWater('assets/images/ic_harvest.svg',harvestOrWater: 'Harvesting in',date: '33 days 14hr'),
            ],

          ),
        ),
      ),
    );
  }
}


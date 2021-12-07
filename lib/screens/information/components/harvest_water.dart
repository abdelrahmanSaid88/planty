import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/my_theme_colors.dart';

class HarvestWater extends StatelessWidget {

  String? date;
  String? harvestOrWater;
  String? iconHarvestOrWater;

  HarvestWater(this.iconHarvestOrWater,{this.date,this.harvestOrWater});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4),
          child: Container(
            width: 28.0,
            height: 28.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: MyThemeColors.waterColor),
            child: SvgPicture.asset('$iconHarvestOrWater'),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              '$harvestOrWater',
              style: GoogleFonts.robotoSlab(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: MyThemeColors.colorOff),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                '$date',
                style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: MyThemeColors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
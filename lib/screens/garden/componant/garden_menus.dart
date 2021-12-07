import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/my_theme_colors.dart';

class GardenMenus extends StatelessWidget {
  // const GardenMenu({Key? key}) : super(key: key);
  String? plantImage;
  String? plantName;
  String? date;
  Function detielsPress;
  bool isHarvest = true;

  GardenMenus(this.isHarvest, this.detielsPress,
      {this.plantImage, this.plantName, this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){detielsPress();},
      child: Center(
        child: Container(
          height: 135,
          width: 428,
          margin: const EdgeInsets.only(top: 17.0),
          child: Card(
            color: MyThemeColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                width: 2,
                color: MyThemeColors.mainDarkGreen,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 13),
                Image.asset('$plantImage'),
                const SizedBox(width: 30),
                Text('$plantName',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: MyThemeColors.mainDarkGreen)),
                const SizedBox(width: 41),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Container(
                        width: 61.0,
                        height: 23.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isHarvest
                                ? MyThemeColors.harvestGreen
                                : MyThemeColors.colorOff),
                        child: Center(
                          child: Text(
                            isHarvest ? 'Harvest' : 'Off',
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: MyThemeColors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 28.0,
                          height: 28.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: isHarvest
                                  ? MyThemeColors.waterColor
                                  : MyThemeColors.colorOff),
                          child: SvgPicture.asset("assets/images/ic_water.svg"),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '$date',
                          style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: MyThemeColors.waterColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
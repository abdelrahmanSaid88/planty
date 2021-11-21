import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_colors.dart';

class HomeMenus extends StatelessWidget {
  // const HomeMenu({Key? key}) : super(key: key);
  String? plantImage;
  String? plantName;
  String? date;
  Function detielsPress;
  bool isHarvest = true;

  HomeMenus(
    this.isHarvest,
    this.detielsPress, {
    this.plantImage,
    this.plantName,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        detielsPress();
      },
      child: Container(
        height: 200,
        width: 172,
        margin: const EdgeInsets.only(top: 17.0),
        child: Card(
          color: MyThemeColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              width: 1,
              color: MyThemeColors.mainDarkGreen,
            ),
          ),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset('$plantImage'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text('$plantName',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: MyThemeColors.black)),
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
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
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: MyThemeColors.white),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 5),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 4),
                    child: Container(
                      width: 28.0,
                      height: 28.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: isHarvest
                              ? MyThemeColors.waterColor
                              : MyThemeColors.colorOff),
                      child: SvgPicture.asset("assets/images/ic_water.svg"),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '$date',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: MyThemeColors.waterColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

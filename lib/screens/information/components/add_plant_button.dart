import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/components/my_theme_colors.dart';

class AddPlantButton extends StatelessWidget {
  // const AddPlantButton({Key? key,}) : super(key: key);
  Function addPlant;
  String? add;

  AddPlantButton(this.addPlant, this.add);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
          onPressed: addPlant(),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(MyThemeColors.mainDarkGreen)),
          child: Text('$add',
              style: GoogleFonts.robotoSlab(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: MyThemeColors.white))),
    );
  }
}
/*
decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
 */

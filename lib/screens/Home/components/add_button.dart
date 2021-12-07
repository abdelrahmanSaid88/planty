import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/my_theme_colors.dart';

class AddButton extends StatelessWidget {
  // const AddButton({Key? key}) : super(key: key);

  Function? press;
  AddButton( this.press);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114.0,
      height: 40.0,
      padding:const EdgeInsets.only(top: 10,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        //color: MyThemeColors.backgroundColor
      ),
      // alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        icon: Icon(Icons.add,
          color: MyThemeColors.mainDarkGreen,
          size: 22.0,
        ),
        style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(MyThemeColors.backgroundColor)),
        label:Text('Add Plant',
            style: GoogleFonts.poorStory(
                fontWeight: FontWeight.w200,
                fontSize: 13,
                color: MyThemeColors.mainDarkGreen)),
        onPressed:press as void Function(),
      ),
    );
  }
}
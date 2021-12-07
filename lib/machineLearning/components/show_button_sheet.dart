import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/my_theme_colors.dart';

class ShowBottomSheet extends StatelessWidget{
  dynamic pickFromGallery ;
  dynamic pickFromCamera ;

  ShowBottomSheet({ this.pickFromGallery , this.pickFromCamera});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(50)),
              color:MyThemeColors.mainDarkGreen,
            ),
            height: 250,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Center(
                        child: Text(
                          'Choice Camera Or Gallery ?',
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: MyThemeColors.white)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        onPressed: () {pickFromGallery!();
                        Navigator.pop(context);},
                        shape:const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            )),
                        child: Text(' Gallery',
                            style: TextStyle(color: MyThemeColors.white)),
                        color:  MyThemeColors.darkGreen,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        onPressed: () {pickFromCamera!();
                        Navigator.pop(context);},
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            )),
                        child:  Text('Camera',
                            style: TextStyle(color: MyThemeColors.white)),
                        color:  MyThemeColors.darkGreen,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
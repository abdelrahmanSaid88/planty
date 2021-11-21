import 'package:flutter/material.dart';

class RecentPhotosMenu extends StatelessWidget {
  //const RecentPhotosMenu({Key? key}) : super(key: key);
  Function? detielsPress;
  String? recentImage;

  RecentPhotosMenu({this.detielsPress, this.recentImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        detielsPress;
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,top: 8),
        child: Center( child: Image.asset('$recentImage')),
      ),
    );
  }
}

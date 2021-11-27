import 'package:flutter/cupertino.dart';
import 'package:planty/screens/scan/componant/scen_menu.dart';

class ScanMenuScroll extends StatelessWidget {
//  const ScanMenuScroll({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ScanMenu('assets/images/img_insect.png'),
          ScanMenu('assets/images/img_insect.png'),
          ScanMenu('assets/images/img_insect.png'),
          ScanMenu('assets/images/img_insect.png'),
          ScanMenu('assets/images/img_insect.png'),
        ],
      ),
    );
  }
}
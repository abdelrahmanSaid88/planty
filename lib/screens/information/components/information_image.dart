import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationImage extends StatelessWidget {
  const InformationImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: FittedBox(child: Image.asset('assets/images/img_test_tom.png'),
            fit: BoxFit.fitWidth,
          ),
        ));
  }
}

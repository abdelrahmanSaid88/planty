import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planty/my_theme_colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 125,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage("assets/images/person.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child:InkWell(
                onTap: () {
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: ((builder) => bottomSheet()),
                  // );
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28.0,
                ),
              ),

            ),
          )
        ],
      ),
    );
  }

}
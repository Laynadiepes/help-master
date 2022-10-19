import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/constants.dart';

class TopProfile extends StatelessWidget {
  const TopProfile(this.profilePic, {Key? key}) : super(key: key);

  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage()),
          Positioned(
            top: top,
            child: buildProfileImage(profilePic),
          )
        ]);
  }
}

Widget buildCoverImage() {
  return Container(
    color: primary,
    child: Image.network(
      firstImage,
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );
}

Widget buildProfileImage(final String profilePic) {
  return CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: primary,
    backgroundImage: AssetImage(profilePic),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/constants.dart';

class Infos extends StatelessWidget {
  Infos({required this.icon, required this.text, required this.info, Key? key})
      : super(key: key);

  IconData icon;
  String text;
  String info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        this.icon,
        color: subTextColor,
      ),
      title: Text(
        this.text,
        style: const TextStyle(
          color: textColor,
          fontSize: 14,
        ),
      ),
      trailing: Text(
        this.info,
        textAlign: TextAlign.end,
        style: const TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

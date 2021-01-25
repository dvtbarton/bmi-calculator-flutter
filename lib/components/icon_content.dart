import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  final String iconText;
  final IconData icon;

  IconContent({this.icon, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          iconText,
          style: LABEL_TEXT_STYLE,
        ),
      ],
    );
  }
}

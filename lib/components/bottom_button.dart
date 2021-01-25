import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTap, @required this.buttonTitle});
  final Function buttonTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.buttonTap,
      child: Container(
        alignment: Alignment.center,
        color: BOTTOM_CONTAINER_COLOR,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: BOTTOM_CONTAINER_HEIGHT,
        child: Text(
          this.buttonTitle,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

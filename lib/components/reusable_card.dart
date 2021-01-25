import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function onPress;

  ReusableCard(
      {this.cardColor = const Color(0xFF1D1E33), this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

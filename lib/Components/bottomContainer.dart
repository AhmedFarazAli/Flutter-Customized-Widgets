import 'package:flutter/material.dart';
import 'constants.dart';
class BottomContain extends StatelessWidget {
  const BottomContain({ required this.textCal,required this.onTap});

  final Function() onTap;
  final String textCal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomContainerHeight,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        color: kBottomContainerColor,
        child: Center(
          child:  Text(
            textCal,
            style:
            TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
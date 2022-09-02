import 'package:flutter/material.dart';
import 'constants.dart';
class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        fillColor: kInactiveReusableContainerColor,
        constraints: const BoxConstraints(minWidth: 56, minHeight: 56),
        shape: const CircleBorder(),
        child: Icon(icon));
  }
}
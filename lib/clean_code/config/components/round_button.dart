import 'package:bloc_learning/clean_code/config/color/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double height;

  const RoundButton({super.key, required this.title, this.onPressed, required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height,
          color: AppColors.buttonColor,
          child: Center(child: Text(title))),
    );
  }
}

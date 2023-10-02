import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';

class CustomButton extends StatelessWidget {
  final ValueChanged<bool>? onFocusChange;
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.onFocusChange,
    required this.text,
    this.backgroundColor = ManagerColors.primaryColor,
    this.fontSize = 16,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onFocusChange: onFocusChange,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(ManagerWeight.w100, ManagerHeight.h38),
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(fontSize: fontSize, color: ManagerColors.white),
      ),
    );
  }
}

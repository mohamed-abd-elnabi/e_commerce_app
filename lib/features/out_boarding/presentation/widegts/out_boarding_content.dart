import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';

Column outBoardingContent({
  String image = ManagerAssets.outboarding1,
  String? title,
  String? subtitle,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset(image),
      Text(
        title ?? ManagerStrings.outboardingTitleOne,
        style: TextStyle(
            color: ManagerColors.secondaryColor,
            fontSize: ManagerFontSize.s26,
            fontWeight: ManagerFontWeight.bold,
            letterSpacing: ManagerConestant.letterSpacing3),
      ),
      SizedBox(
        height: ManagerHeight.h70,
        child: Text(
          subtitle ?? ManagerStrings.subtitle1,
          style: TextStyle(
            color: ManagerColors.secondaryColor,
            fontSize: ManagerFontSize.s16,
            fontWeight: ManagerFontWeight.Regular,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: ManagerHeight.h20,
      )
    ],
  );
}

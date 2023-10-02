import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/resources/managar_font_size.dart';
import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_font_weight.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_strings.dart';

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
            fontSize: ManagerFontSize.s26,
            fontWeight: ManagerFontWeight.bold,
            letterSpacing: ManagerConestant.letterSpacing3),
      ),
      SizedBox(
        height: ManagerHeight.h100,
        child: Text(
          maxLines: 3,
          subtitle ?? ManagerStrings.subtitle1,
          style: getRegularTextStyle(
            fontSize: ManagerFontSize.s16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: ManagerHeight.h20,
      )
    ],
  );
}

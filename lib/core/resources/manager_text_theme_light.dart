import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';

import 'manager_text_styles.dart';

class ManagerTextThemeLight extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.primaryTextColor,
      );

  @override
  TextStyle get displaySmall => getBoldTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.primaryTextColor,
      );
  @override
  TextStyle get headlineMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.primaryTextColor,
      );
  @override
  TextStyle get headlineSmall => getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.primaryTextColor,
      );

  @override
  TextStyle get bodyLarge => getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.primaryTextColor,
      );
}

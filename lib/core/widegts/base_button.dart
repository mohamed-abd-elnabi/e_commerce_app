import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';

import '../resources/managar_font_size.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_font_weight.dart';
import '../resources/manager_height.dart';
import '../resources/manager_icon_size.dart';
import '../resources/manager_spacer.dart';
import '../resources/manager_strings.dart';

// ignore: camel_case_types
class base_button extends StatelessWidget {
  final String? title;
  final bool isVisibalIcon;
  final double width;
  final double height;
  final double elevation;
  void Function() onPeessed;
  final Color bgColor;
  final int? spacer;

  base_button({
    this.title,
    this.isVisibalIcon = false,
    this.width = ManagerWeight.Winfinity,
    this.height = ManagerHeight.h50,
    this.elevation = ManagerConestant.elevationAppbar,
    this.bgColor = ManagerColors.primaryColor,
    required this.onPeessed,
    this.textStyle,
    this.spacer,
  });
  TextStyle? textStyle = const TextStyle(
    color: ManagerColors.white,
    fontSize: ManagerFontSize.s18,
    fontWeight: ManagerFontWeight.Regular,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: ManagerHeight.h20),
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPeessed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(
              flex: spacer ?? ManagerSpacer.s4,
            ),
            Text(
              title.onNull(),
              style: textStyle,
            ),
            const Spacer(
              flex: ManagerSpacer.s3,
            ),
            Visibility(
              visible: isVisibalIcon,
              child: const Icon(
                Icons.arrow_forward,
                color: ManagerColors.white,
                size: ManagerIconSize.s20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

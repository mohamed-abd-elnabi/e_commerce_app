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

class base_button extends StatelessWidget {
  final String? title;
  final bool isVisibalIcon;
  final double? width;
  final double? height;
  final double elevation;
  void Function() onPreessed;
  final Color bgColor;
  final int? spacer;

  base_button({
    this.title,
    this.isVisibalIcon = false,
    this.width,
    this.height,
    this.elevation = ManagerConestant.elevationAppbar,
    this.bgColor = ManagerColors.primaryColor,
    required this.onPreessed,
    this.textStyle,
    this.spacer,
  });
  TextStyle? textStyle = TextStyle(
    color: ManagerColors.white,
    fontSize: ManagerFontSize.s18,
    fontWeight: ManagerFontWeight.regular,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: ManagerHeight.h20),
      height: height ?? ManagerHeight.h50,
      width: width ?? ManagerWeight.wInfinity,
      child: ElevatedButton(
        onPressed: onPreessed,
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

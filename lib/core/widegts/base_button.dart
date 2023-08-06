import 'package:flutter/material.dart';
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
  final String title;
  final bool isVisibalIcon;
  final double width;
  final double height;
  //final double elevation;
  void Function() onPeessed;

  base_button({
    this.title = ManagerStrings.start,
    this.isVisibalIcon = false,
    this.width = ManagerWeight.Winfinity,
    this.height = ManagerHeight.h50,
    required this.onPeessed,
  });

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
            backgroundColor: ManagerColors.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: ManagerSpacer.s4,
            ),
            Text(
              title,
              style: const TextStyle(
                color: ManagerColors.white,
                fontSize: ManagerFontSize.s18,
                fontWeight: ManagerFontWeight.Regular,
              ),
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

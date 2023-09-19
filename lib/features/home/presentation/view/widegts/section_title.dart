import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles_light.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';

InkWell sectionTitle({
  String? title,
  Function()? onPressed,
}) {
  return InkWell(
    onTap: onPressed ?? () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? ManagerStrings.bestProduct,
          style: getBoldTextStyle(fontSize: ManagerFontSize.s18),
        ),
        Container(
          height: ManagerHeight.h30,
          width: ManagerWeight.w100,
          alignment: AlignmentDirectional.center,
          margin: EdgeInsetsDirectional.only(end: ManagerWeight.w20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ManagerRaduis.r20),
              border: Border.all(color: ManagerColors.grey)),
          child: Text(
            ManagerStrings.showMore,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s12, color: ManagerColors.grey),
          ),
        )
      ],
    ),
  );
}

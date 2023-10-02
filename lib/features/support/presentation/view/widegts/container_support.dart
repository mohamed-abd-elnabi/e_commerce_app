import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_raduis.dart';
import '../../../../../core/resources/manager_text_styles.dart';
import '../../../../../core/resources/manager_weight.dart';

Container ContainerSupport({
  required BuildContext context,
  required String image,
  required String title,
}) {
  return Container(
    decoration: BoxDecoration(
        color: ManagerColors.white,
        borderRadius:
            BorderRadiusDirectional.all(Radius.circular(ManagerRaduis.r20))),
    margin: EdgeInsetsDirectional.symmetric(horizontal: ManagerHeight.h20),
    width: double.infinity,
    height: MediaQuery.sizeOf(context).height * 0.1,
    child: Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: ManagerHeight.h26),
      child: Row(
        children: [
          Image.asset(height: ManagerHeight.h50, image),
          SizedBox(
            width: ManagerWeight.w16,
          ),
          Text(
            title,
            style: getMediumTextStyle(color: ManagerColors.grey),
          )
        ],
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_weight.dart';

Container progressIndicator({
  Color color = ManagerColors.blake,
  double width = ManagerWeight.w9,
}) {
  return Container(
    height: ManagerHeight.h9,
    width: width,
    decoration: BoxDecoration(
        color: color,
        borderRadius:
            const BorderRadius.all(Radius.circular(ManagerRaduis.r20))),
  );
}

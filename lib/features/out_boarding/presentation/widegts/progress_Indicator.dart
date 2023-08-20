import 'package:flutter/cupertino.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_weight.dart';

Container progressIndicator({
  Color color = ManagerColors.blake,
  double? width,
}) {
  return Container(
    height: ManagerHeight.h9,
    width: width ?? ManagerWeight.w9,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(ManagerRaduis.r20))),
  );
}

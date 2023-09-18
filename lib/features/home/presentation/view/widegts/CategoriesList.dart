import 'package:flutter/material.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_raduis.dart';
import '../../../../../core/resources/manager_weight.dart';
import '../../controller/home_controller.dart';

SizedBox CategoriesList(HomeController controller) {
  return SizedBox(
    height: ManagerHeight.h100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.categories.length,
      itemBuilder: (context, index) {
        return Container(
          height: ManagerHeight.h100,
          width: ManagerWeight.w100,
          margin: EdgeInsetsDirectional.only(
            end: ManagerWeight.w8,
          ),
          decoration: BoxDecoration(
            color: ManagerColors.white,
            borderRadius: BorderRadius.circular(ManagerRaduis.r12),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                    height: ManagerHeight.h50,
                    controller.categories[index].banner),
                Text(
                  maxLines: 1,
                  controller.categories[index].name,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ]),
        );
      },
    ),
  );
}

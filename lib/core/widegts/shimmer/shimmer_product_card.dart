import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_raduis.dart';
import '../../../../../core/resources/manager_weight.dart';
import '../../../features/home/presentation/controller/home_controller.dart';

SizedBox CategoriesListShimmer(HomeController controller) {
  return SizedBox(
    height: ManagerHeight.h100,
    child: Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.black,
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
                  Container(
                    height: ManagerHeight.h50,
                    color: Colors.grey,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey,
                    height: ManagerHeight.h50,
                  ),
                ]),
          );
        },
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_padding.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_raduis.dart';
import '../../../../../core/resources/manager_text_styles.dart';
import '../../../../home/presentation/controller/home_controller.dart';
import '../../../../home/presentation/model/home_model.dart';

SizedBox SizedBoxFirstForm(
    BuildContext context, HomeController controllerHome) {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * 0.8,
    width: double.infinity,
    child: ListView.builder(
      itemCount: controllerHome.homeModel.data.length,
      itemBuilder: (context, index) {
        HomeModelData homeDataModel = controllerHome.homeModel.data[index];
        return InkWell(
          onTap: () {
            controllerHome.productDetails(context, homeDataModel.id);
          },
          child: Container(
            margin: EdgeInsetsDirectional.all(ManagerHeight.h10),
            padding: const EdgeInsetsDirectional.all(ManagerPadding.p20),
            decoration: BoxDecoration(
                color: ManagerColors.white,
                borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(ManagerRaduis.r20))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      ManagerRaduis.r10,
                    ),
                    child: SizedBox(
                      height: ManagerHeight.h80,
                      width: ManagerWeight.w10,
                      child: controllerHome.image(
                        courseAvatar: homeDataModel.thumbnailImage.toString(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ManagerWeight.w50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ManagerWeight.w150,
                      child: Text(
                        homeDataModel.name.toString(),
                        style: getBoldTextStyle(color: ManagerColors.blake),
                      ),
                    ),
                    Text(
                      homeDataModel.basePrice.toString(),
                      style: getMediumTextStyle(color: ManagerColors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          homeDataModel.baseDiscountedPrice.toString(),
                          style: getMediumTextStyle(color: ManagerColors.grey),
                        ),
                        SizedBox(
                          width: ManagerWeight.w20,
                        ),
                        Visibility(
                          visible: homeDataModel.baseDiscountedPrice != 0.0,
                          child: Text(ManagerStrings.discounted,
                              style: getRegularTextStyle(
                                  color: ManagerColors.primaryColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller.dart';
import 'package:shop_avatar/features/show_more_products/presentation/controller/show_more_products_controller.dart';
import 'package:shop_avatar/features/show_more_products/presentation/view/widgets/sized_box_first_form.dart';
import 'package:shop_avatar/features/show_more_products/presentation/view/widgets/sized_box_second_form.dart';
import '../../../../core/constants.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_text_styles.dart';
import '../../../../core/resources/manager_weight.dart';

class ShowMoreProducts extends StatelessWidget {
  const ShowMoreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowMoreProductsController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ManagerColors.homeScaffoldBackGround,
        appBar: AppBar(
          backgroundColor: ManagerColors.transparent,
          elevation: ManagerConestant.elevationAppbar,
          title: Text(
            ManagerStrings.products.toUpperCase(),
            style: getBoldTextStyle(
              fontSize: ManagerFontSize.s18,
            ),
          ),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () {
                  controller.toggleIconAndText();
                },
                child: controller.isIconChanged
                    ? Image.asset(
                        height: ManagerHeight.h24, ManagerAssets.menu2)
                    : Image.asset(
                        height: ManagerHeight.h24, ManagerAssets.menu)),
            SizedBox(
              width: ManagerWeight.w16,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ManagerColors.white,
                borderRadius: BorderRadius.circular(
                  ManagerRaduis.r100,
                ),
              ),
              margin: EdgeInsetsDirectional.only(
                end: ManagerWeight.w20,
                top: ManagerHeight.h4,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  SizedBox(width: ManagerWeight.w16),
                  Expanded(
                    child: Text(
                      ManagerStrings.search,
                      style: getMediumTextStyle(
                        color: ManagerColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ManagerHeight.h20),
            SingleChildScrollView(
              child: GetBuilder<HomeController>(builder: (controllerHome) {
                if (controller.isIconChanged == true) {
                  return SizedBoxFirstForm(context, controllerHome);
                } else {
                  return SizedBoxSecondForm(context, controllerHome);
                }
              }),
            )
          ],
        ),
      );
    });
  }
}

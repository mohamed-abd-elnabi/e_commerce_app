import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_icon_size.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_spacer.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_text_styles.dart';
import '../../../../core/widegts/base_button.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(Icons.check),
            SizedBox(
              width: ManagerWeight.w16,
            )
          ],
          title: Text(ManagerStrings.editProfile.toUpperCase(),
              style: getRegularTextStyle(fontSize: ManagerFontSize.s18)),
          centerTitle: true,
          backgroundColor: ManagerColors.homeScaffoldBackGround,
        ),
        body: Container(
          margin:
              EdgeInsetsDirectional.symmetric(horizontal: ManagerWeight.w26),
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h26,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(ManagerAssets.profile),
                  Container(
                    height: ManagerHeight.h120,
                    width: ManagerWeight.w120,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadiusDirectional.circular(
                            ManagerRaduis.r100)),
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: ManagerIconSize.s36,
                    color: ManagerColors.white,
                  )
                ],
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text(
                      ManagerStrings.userName,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.greyLight)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ManagerColors.primaryColor)),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.error))),
              ),
              SizedBox(
                height: ManagerHeight.h20,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.amber,
                    label: Text(
                      ManagerStrings.email,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.greyLight)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ManagerColors.primaryColor)),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.error))),
              ),
              SizedBox(
                height: ManagerHeight.h20,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.amber,
                    label: Text(
                      ManagerStrings.phone,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.greyLight)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ManagerColors.primaryColor)),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.error))),
              ),
              SizedBox(
                height: ManagerHeight.h100,
              ),
              base_button(
                title: ManagerStrings.save,
                onPreessed: () {},
                isVisibalIcon: false,
                spacer: ManagerSpacer.s3,
                bgColor: ManagerColors.primaryColor,
                textStyle: getRegularTextStyle(
                    color: ManagerColors.white, fontSize: ManagerFontSize.s18),
              ),
            ],
          ),
        ));
  }
}

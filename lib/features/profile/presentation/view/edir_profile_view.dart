import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
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
          title: Text('Edit profile'.toUpperCase(),
              style: getRegularTextStyle(fontSize: 18)),
          centerTitle: true,
          backgroundColor: const Color(0xffF8F8FC),
        ),
        body: Container(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h26,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset('assets/images/drawer/profile.png'),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadiusDirectional.circular(150)),
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: 36,
                    color: ManagerColors.white,
                  )
                ],
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.amber,
                    label: Text(
                      'User Name',
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
                      'Phone',
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
                title: 'Save',
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

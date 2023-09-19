import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/routes/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.editProfileView);
            },
            child: Image.asset(
              ManagerAssets.editButton,
              filterQuality: FilterQuality.high,
              width: ManagerWeight.w24,
            ),
          ),
          SizedBox(
            width: ManagerWeight.w16,
          ),
          Image.asset(
            ManagerAssets.logout,
            width: ManagerWeight.w24,
          ),
          SizedBox(
            width: ManagerWeight.w16,
          ),
        ],
        title: Text(ManagerStrings.profile.toUpperCase(),
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.white)),
        centerTitle: true,
        elevation: ManagerConestant.elevationAppbar,
        iconTheme: const IconThemeData(color: ManagerColors.white),
        backgroundColor: ManagerColors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            ManagerAssets.bgSlider,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(
                height: ManagerHeight.h20,
              ),
              Image.asset(ManagerAssets.profile),
              Container(
                decoration: BoxDecoration(
                    color: ManagerColors.white,
                    borderRadius: BorderRadiusDirectional.all(
                        Radius.circular(ManagerRaduis.r20))),
                margin: EdgeInsetsDirectional.symmetric(
                    vertical: ManagerWeight.w28, horizontal: ManagerHeight.h20),
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: ManagerHeight.h26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        ManagerStrings.userName,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.primaryColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        'Mohammed emad',
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h26,
                      ),
                      Divider(
                        height: ManagerHeight.h1,
                        thickness: 1,
                        color: ManagerColors.greyLight,
                      ),
                      /////////////////////////
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        ManagerStrings.email,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.primaryColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        'mohammedherez@gmail.com',
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h26,
                      ),
                      Divider(
                        height: ManagerHeight.h1,
                        thickness: 1,
                        color: ManagerColors.greyLight,
                      ),
                      /////////////////////////
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        ManagerStrings.mobileNumber,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.primaryColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        '+1 986-786-421',
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h26,
                      ),
                      Divider(
                        height: ManagerHeight.h1,
                        thickness: 1,
                        color: ManagerColors.greyLight,
                      ),
                      /////////////////////////
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Password',
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s18,
                                color: ManagerColors.primaryColor),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff393939)),
                              onPressed: () {},
                              child: const Text(
                                'Change',
                                style: TextStyle(color: ManagerColors.white),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        '............',
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s20,
                            color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Divider(
                        height: ManagerHeight.h1,
                        thickness: 1,
                        color: ManagerColors.greyLight,
                      ),
                      /////////////////////////
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../core/constants.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text(ManagerStrings.invite.toUpperCase(),
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s18, color: ManagerColors.blake)),
        centerTitle: true,
        elevation: ManagerConestant.elevationAppbar,
        backgroundColor: ManagerColors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Image.asset(ManagerAssets.mmm),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Text(
            ManagerStrings.new4shop,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.blake),
          ),
          Container(
            decoration: BoxDecoration(
                color: ManagerColors.white,
                borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(ManagerRaduis.r20))),
            margin: EdgeInsetsDirectional.symmetric(
                vertical: ManagerWeight.w16, horizontal: ManagerHeight.h20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: ManagerHeight.h16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ManagerHeight.h20,
                  ),
                  Text(
                    ManagerStrings.inviteYourFriends,
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.blake),
                  ),
                  SizedBox(
                    height: ManagerHeight.h24,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        ManagerAssets.skype,
                        height: ManagerHeight.h100,
                      ),
                      Image.asset(
                        height: ManagerHeight.h100,
                        ManagerAssets.email,
                      ),
                      Image.asset(height: ManagerHeight.h100, ManagerAssets.x),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                          height: ManagerHeight.h100, ManagerAssets.fasebook),
                      Image.asset(
                        height: ManagerHeight.h100,
                        ManagerAssets.google,
                      ),
                      Image.asset(
                          height: ManagerHeight.h100, ManagerAssets.whatsApp),
                    ],
                  ),
                  Image.asset(
                    height: ManagerHeight.h100,
                    ManagerAssets.masenger,
                  ),
                  SizedBox(
                    height: ManagerHeight.h24,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: ManagerColors.white,
                borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(ManagerRaduis.r20))),
            margin:
                EdgeInsetsDirectional.symmetric(horizontal: ManagerHeight.h20),
            width: double.infinity,
            height: ManagerHeight.h60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ManagerAssets.externallink),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    decoration: BoxDecoration(
                        color: ManagerColors.homeScaffoldBackGround,
                        borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(ManagerRaduis.r12))),
                    width: ManagerWeight.w180,
                    height: ManagerHeight.h40,
                    child: Text(ManagerStrings.http),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ManagerColors.blake),
                      onPressed: () {},
                      child: Text(
                        ManagerStrings.cobyLink,
                        style: const TextStyle(color: ManagerColors.white),
                      )),
                ]),
          ),
        ],
      ),
    );
  }
}

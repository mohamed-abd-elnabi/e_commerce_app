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

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text(ManagerStrings.about.toUpperCase(),
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
                vertical: ManagerWeight.w26, horizontal: ManagerHeight.h20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: ManagerHeight.h26),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ManagerHeight.h20,
                    ),
                    Text(
                      ManagerStrings.about,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s18,
                          color: ManagerColors.blake),
                    ),
                    SizedBox(
                      height: ManagerHeight.h24,
                    ),
                    Text(
                      '''Voluptates tempora tempora fugiat quidem delectus rerum. Libero et velit earum. Minus quia ab eligendi blanditiis harum sint laborum omnis. Nulla fugiat sapiente explicabo quisquam dolor excepturi.

Repudiandae alias quo ut. Quos non id. Sit quos maiores ad voluptatem aliquid. Blanditiis numquam aspernatur et.

A rerum tenetur. Vero in aut molestias labore et vel illum ut. Voluptatibus consequatur consequatur non. Dolorum aliquam eum rem natus. Aperiam possimus consequatur voluptates omnis. Ipsa non ad fugiat illum est deleniti perspiciatis id.

At consequuntur at dolorem cum rerum sit accusantium. Atque deleniti ratione est reprehenderit vero voluptatum magni aut. Et id fuga. Magnam quod omnis ut cupiditate et maiores quisquam ut.

Praesentium vel officiis est voluptatem quam voluptates incidunt. Totam nemo sapiente veniam cum alias. Facere odio nobis quo corrupti accusamus. Ratione voluptate facere quaerat quia.''',
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.grey),
                    ),
                    SizedBox(
                      height: ManagerHeight.h24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

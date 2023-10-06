import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text('Cart'.toUpperCase(),
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.blake)),
        centerTitle: true,
        elevation: ManagerConestant.elevationAppbar,
        backgroundColor: ManagerColors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Container(
            decoration: BoxDecoration(
                color: ManagerColors.white,
                borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(ManagerRaduis.r20))),
            margin: EdgeInsetsDirectional.symmetric(
              vertical: ManagerWeight.w28,
              horizontal: ManagerHeight.h20,
            ),
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
                      'Accessories ',
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s26,
                          color: ManagerColors.blake),
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

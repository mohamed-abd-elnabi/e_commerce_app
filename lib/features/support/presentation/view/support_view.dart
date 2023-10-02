import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/features/support/presentation/view/widegts/container_support.dart';
import '../../../../core/resources/manager_assets.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text(ManagerStrings.support.toUpperCase(),
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.blake)),
        centerTitle: true,
        elevation: ManagerConestant.elevationAppbar,
        backgroundColor: ManagerColors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ManagerHeight.h40,
          ),
          Text(
            ManagerStrings.anyQueries,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColors.blake),
          ),
          SizedBox(
            height: ManagerHeight.h16,
          ),
          ContainerSupport(
              context: context,
              image: ManagerAssets.support,
              title: ManagerStrings.numberSuboort),
          SizedBox(
            height: ManagerHeight.h24,
          ),
          ContainerSupport(
              context: context,
              image: ManagerAssets.masseeg,
              title: ManagerStrings.numberSuboort),
          SizedBox(
            height: ManagerHeight.h24,
          ),
          ContainerSupport(
              context: context,
              image: ManagerAssets.whats,
              title: ManagerStrings.numberSuboort),
          SizedBox(
            height: ManagerHeight.h24,
          ),
        ],
      ),
    );
  }
}

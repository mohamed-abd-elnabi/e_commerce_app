import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../../core/resources/managar_font_size.dart';
import '../../../../../routes/routes.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_height.dart';
import '/core/resources/manager_strings.dart';
import '/core/resources/manager_text_styles.dart';
import '/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_drawer/slide_drawer.dart';

class SliderDrawer extends StatelessWidget {
  const SliderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ManagerColors.primaryColor,
        body: Stack(children: [
          Image.asset(
            ManagerAssets.bgSlider,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ManagerHeight.h26,
                ),
                InkWell(
                  onTap: () {
                    SlideDrawer.of(context)?.close();
                  },
                  child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      margin: EdgeInsetsDirectional.symmetric(
                          horizontal: ManagerWeight.w20,
                          vertical: ManagerHeight.h20),
                      child: Image.asset(ManagerAssets.iconBack)),
                ),
                SizedBox(
                  height: ManagerHeight.h20,
                ),
                Image.asset(ManagerAssets.profile),
                Text(
                  controller.appSettingsSharedPreferences.getUserInfo().name,
                  style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s20,
                    color: ManagerColors.white,
                  ),
                ),
                SizedBox(height: ManagerHeight.h14),
                Text(
                  controller.appSettingsSharedPreferences.getUserInfo().email,
                  style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColors.white,
                  ),
                ),
                SizedBox(height: ManagerHeight.h14),
                Column(
                  children: [
                    // Home
                    drawerItem(
                      icon: Icons.home,
                      title: ManagerStrings.home,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.homePage);
                      },
                    ),

                    // Notification
                    drawerItem(
                      icon: Icons.notifications,
                      title: ManagerStrings.notifications,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.notificationsScreen);
                      },
                    ),

                    // Profile
                    drawerItem(
                      icon: Icons.person,
                      title: ManagerStrings.profile,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.profileScreen);
                      },
                    ),

                    // My Orders
                    drawerItem(
                      icon: Icons.book,
                      title: ManagerStrings.myOrders,
                      onPressed: () {},
                    ),

                    // Payment
                    drawerItem(
                      icon: Icons.payment,
                      title: ManagerStrings.myPayment,
                      onPressed: () {},
                    ),

                    // My Wishlist
                    drawerItem(
                      icon: Icons.star_border,
                      title: ManagerStrings.shareApp,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.shareApp);
                      },
                    ),

                    // My Address
                    drawerItem(
                      icon: Icons.add_location,
                      title: ManagerStrings.myAddress,
                      onPressed: () {},
                    ),

                    // Support
                    drawerItem(
                      icon: Icons.support_agent_outlined,
                      title: ManagerStrings.support,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.supportView);
                      },
                    ),

                    // Language
                    drawerItem(
                      icon: Icons.language,
                      title: ManagerStrings.language,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.localView);
                      },
                    ),

                    // About
                    drawerItem(
                      icon: Icons.question_mark,
                      title: ManagerStrings.about,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.aboutView);
                      },
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ]),
      );
    });
  }

  Widget drawerItem({
    required IconData icon,
    required String title,
    required void Function() onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: ManagerConestant.elevationAppbar,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          SizedBox(width: ManagerWeight.w40),
          Icon(
            icon,
            color: ManagerColors.white,
          ),
          SizedBox(width: ManagerWeight.w20),
          Text(
            title,
            style: getRegularTextStyle(
              color: ManagerColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
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
              'assets/images/profile/edit-button.png',
              filterQuality: FilterQuality.high,
              width: 24,
            ),
          ),
          SizedBox(
            width: ManagerWeight.w16,
          ),
          Image.asset(
            'assets/images/profile/logout.png',
            width: 24,
          ),
          SizedBox(
            width: ManagerWeight.w16,
          ),
        ],
        title: Text('profile'.toUpperCase(),
            style: getBoldTextStyle(fontSize: 20, color: ManagerColors.white)),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ManagerColors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/drawer/bg.png',
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/drawer/profile.png'),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(20))),
                margin: const EdgeInsetsDirectional.symmetric(
                    vertical: 28, horizontal: 20),
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        'UserName',
                        style: getRegularTextStyle(
                            fontSize: 18, color: ManagerColors.primaryColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        'Mohammed emad',
                        style: getBoldTextStyle(
                            fontSize: 18, color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h26,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: ManagerColors.greyLight,
                      ),
                      /////////////////////////
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        'Email',
                        style: getRegularTextStyle(
                            fontSize: 18, color: ManagerColors.primaryColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        'mohammedherez@gmail.com',
                        style: getBoldTextStyle(
                            fontSize: 18, color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h26,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: ManagerColors.greyLight,
                      ),
                      /////////////////////////
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        'Mobile Number',
                        style: getRegularTextStyle(
                            fontSize: 18, color: ManagerColors.primaryColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        '+1 986-786-421',
                        style: getBoldTextStyle(
                            fontSize: 18, color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h26,
                      ),
                      Divider(
                        height: 1,
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
                                fontSize: 18,
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
                            fontSize: 20, color: ManagerColors.blake),
                      ),
                      SizedBox(
                        height: ManagerHeight.h26,
                      ),
                      Divider(
                        height: 1,
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

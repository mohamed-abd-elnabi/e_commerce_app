import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text('Support'.toUpperCase(),
            style: getBoldTextStyle(fontSize: 20, color: ManagerColors.blake)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ManagerColors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ManagerHeight.h40,
          ),
          Text(
            '       Any Queries or feedback?',
            style: getBoldTextStyle(fontSize: 16, color: ManagerColors.blake),
          ),
          SizedBox(
            height: ManagerHeight.h16,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: Row(
                children: [
                  Image.asset(
                      height: ManagerHeight.h50,
                      'assets/images/support/phone.png'),
                  SizedBox(
                    width: ManagerWeight.w16,
                  ),
                  Text(
                    '+970 59543 1541',
                    style: getMediumTextStyle(color: ManagerColors.grey),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
            margin: const EdgeInsetsDirectional.symmetric(
                vertical: 28, horizontal: 20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: Row(
                children: [
                  Image.asset(
                      height: ManagerHeight.h50,
                      'assets/images/support/masseg.png'),
                  SizedBox(
                    width: ManagerWeight.w16,
                  ),
                  Text(
                    '+970 59543 1541',
                    style: getMediumTextStyle(color: ManagerColors.grey),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: Row(
                children: [
                  Image.asset(
                      height: ManagerHeight.h50,
                      'assets/images/support/whats.png'),
                  SizedBox(
                    width: ManagerWeight.w16,
                  ),
                  Text(
                    '+970 59543 1541',
                    style: getMediumTextStyle(color: ManagerColors.grey),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: ManagerHeight.h24,
          ),
        ],
      ),
    );
  }
}

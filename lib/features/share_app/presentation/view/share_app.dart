import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_text_styles_light.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text('Invite'.toUpperCase(),
            style: getBoldTextStyle(fontSize: 20, color: ManagerColors.blake)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ManagerColors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/splach/mmm.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'New4Shop',
            style: getBoldTextStyle(fontSize: 22, color: ManagerColors.blake),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
            margin: const EdgeInsetsDirectional.symmetric(
                vertical: 16, horizontal: 20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ManagerHeight.h20,
                  ),
                  Text(
                    'Invite your friends',
                    style: getBoldTextStyle(
                        fontSize: 18, color: ManagerColors.blake),
                  ),
                  SizedBox(
                    height: ManagerHeight.h24,
                  ),
                  Row(
                    children: [
                      Image.asset(
                          height: ManagerHeight.h100,
                          'assets/images/share_app/skype.png'),
                      Image.asset(
                          height: ManagerHeight.h100,
                          'assets/images/share_app/email.png'),
                      Image.asset(
                          height: ManagerHeight.h100,
                          'assets/images/share_app/x.png'),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                          height: ManagerHeight.h100,
                          'assets/images/share_app/fasebook.png'),
                      Image.asset(
                          height: ManagerHeight.h100,
                          'assets/images/share_app/google.png'),
                      Image.asset(
                          height: ManagerHeight.h100,
                          'assets/images/share_app/whatsApp.png'),
                    ],
                  ),
                  Image.asset(
                      height: ManagerHeight.h100,
                      'assets/images/share_app/masenger.png'),
                  SizedBox(
                    height: ManagerHeight.h24,
                  ),
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
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/share_app/external-link.png'),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    decoration: BoxDecoration(
                        color: ManagerColors.homeScaffoldBackGround,
                        borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(ManagerRaduis.r12))),
                    width: ManagerWeight.w180,
                    height: ManagerHeight.h40,
                    child: const Text('   http://fgtyjmiuyn6yt'),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff393939)),
                      onPressed: () {},
                      child: const Text(
                        'Coby Link',
                        style: TextStyle(color: ManagerColors.white),
                      )),
                ]),
          ),
        ],
      ),
    );
  }
}

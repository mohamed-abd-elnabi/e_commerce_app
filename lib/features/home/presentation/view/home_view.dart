import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_icon_size.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller..dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        backgroundColor: ManagerColors.homeScaffoldBackGround,
        centerTitle: true,
        title: Text(
          ManagerStrings.home.toUpperCase(),
          style: getBoldTextStyle(fontSize: ManagerFontSize.s20),
        ),
        leading: const Icon(
          Icons.menu,
          size: ManagerIconSize.s36,
        ),
        actions: [
          const Icon(
            Icons.qr_code_scanner,
            size: ManagerIconSize.s36,
          ),
          Container(
            margin: EdgeInsets.only(
                right: ManagerWeight.w20, left: ManagerWeight.w20),
            child: const Icon(
              Icons.dashboard_rounded,
              size: ManagerIconSize.s36,
            ),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return Container(
          margin: EdgeInsetsDirectional.only(start: ManagerWeight.w20),
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h14,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(end: ManagerWeight.w20),
                decoration: BoxDecoration(
                    color: ManagerColors.white,
                    borderRadius: BorderRadius.circular(ManagerRaduis.r20)),
                child: Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  SizedBox(
                    width: ManagerWeight.w10,
                  ),
                  Expanded(
                    child: Text(
                      ManagerStrings.search,
                      style: getMediumTextStyle(color: ManagerColors.grey),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list_rounded,
                      color: ManagerColors.primaryColor,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: ManagerHeight.h14,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: ManagerHeight.h100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: ManagerHeight.h100,
                            width: ManagerWeight.w100,
                            margin: EdgeInsetsDirectional.only(
                              end: ManagerWeight.w8,
                            ),
                            decoration: BoxDecoration(
                              color: ManagerColors.white,
                              borderRadius:
                                  BorderRadius.circular(ManagerRaduis.r12),
                            ),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                      height: 50,
                                      controller.categoryList[index].banner),
                                  Text(
                                    maxLines: 1,
                                    controller.categoryList[index].name,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

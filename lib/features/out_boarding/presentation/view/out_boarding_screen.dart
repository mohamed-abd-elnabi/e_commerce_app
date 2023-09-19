import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/features/out_boarding/presentation/controller/outboading_controller.dart';
import '/core/constants.dart';
import '/core/resources/managar_font_size.dart';
import '/core/resources/manager_assets.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/routes/routes.dart';
import '../../../../core/resources/manager_padding.dart';
import '../../../../core/widegts/base_button.dart';
import '../widegts/out_boarding_content.dart';
import '../widegts/progress_Indicator.dart';

class OutBoarding extends StatefulWidget {
  const OutBoarding({super.key});

  @override
  State<OutBoarding> createState() => _OutBoardingState();
}

class _OutBoardingState extends State<OutBoarding> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GetBuilder<OutBoardingController>(builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: Visibility(
                visible: controller.isNotFirstPage(),
                child: IconButton(
                  onPressed: () {
                    controller.pageController.previousPage(
                        duration: const Duration(
                          milliseconds: ManagerConestant.pageViewSliderDuration,
                        ),
                        curve: Curves.easeIn);
                  },
                  icon: const Icon(Icons.arrow_back),
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    right: ManagerPadding.p20, top: ManagerPadding.p10),
                child: Visibility(
                  visible: controller.isNotLastPage(),
                  replacement: TextButton(
                    onPressed: () {
                      controller.appSittingsSharedPreferences
                          .saveViewedOutBoarding();
                    },
                    child: Text(
                      ManagerStrings.start,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.blake,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.pageController.nextPage(
                          duration: const Duration(
                            milliseconds:
                                ManagerConestant.pageViewSliderDuration,
                          ),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      ManagerStrings.naxt,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.blake,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ManagerWeight.w30,
              vertical: ManagerHeight.h34,
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController,
                    onPageChanged: (int value) {
                      setState(() {
                        controller.cuttentpageindex = value;
                      });
                    },
                    children: [
                      outBoardingContent(
                          image: ManagerAssets.outboarding1,
                          title: ManagerStrings.outboardingTitleOne),
                      outBoardingContent(
                          image: ManagerAssets.outboarding2,
                          title: ManagerStrings.outboardingTitleTwo),
                      outBoardingContent(
                          image: ManagerAssets.outboarding3,
                          title: ManagerStrings.outboardingTitleThree),
                      outBoardingContent(
                          image: ManagerAssets.outboarding4,
                          title: ManagerStrings.outboardingTitleFour),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    progressIndicator(
                        color: controller.isFirstPage()
                            ? ManagerColors.grey
                            : ManagerColors.prossColor,
                        width: controller.isFirstPage()
                            ? ManagerWeight.w20
                            : ManagerWeight.w8),
                    SizedBox(
                      width: ManagerWeight.w10,
                    ),
                    progressIndicator(
                        color: controller.isSecondPage()
                            ? ManagerColors.grey
                            : ManagerColors.prossColor,
                        width: controller.isSecondPage()
                            ? ManagerWeight.w20
                            : ManagerWeight.w8),
                    SizedBox(
                      width: ManagerWeight.w10,
                    ),
                    progressIndicator(
                        color: controller.isThirdPage()
                            ? ManagerColors.grey
                            : ManagerColors.prossColor,
                        width: controller.isThirdPage()
                            ? ManagerWeight.w20
                            : ManagerWeight.w8),
                    SizedBox(
                      width: ManagerWeight.w10,
                    ),
                    progressIndicator(
                        color: controller.isLastPage()
                            ? ManagerColors.grey
                            : ManagerColors.prossColor,
                        width: controller.isLastPage()
                            ? ManagerWeight.w20
                            : ManagerWeight.w8),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h50,
                ),
                Visibility(
                  visible: controller.isLastPage(),
                  replacement: base_button(
                    textStyle: const TextStyle(
                      color: ManagerColors.white,
                    ),
                    title: ManagerStrings.skip,
                    onPreessed: () {
                      controller.pageController.animateToPage(
                          ManagerConestant.LastPageindex,
                          duration: const Duration(
                              microseconds:
                                  ManagerConestant.Durationoutbording),
                          curve: Curves.bounceIn);
                    },
                    isVisibalIcon: true,
                  ),
                  child: base_button(
                    title: ManagerStrings.start,
                    textStyle: const TextStyle(
                      color: ManagerColors.white,
                    ),
                    onPreessed: () {
                      Navigator.pushNamed(context, Routes.authScreen);
                      controller.appSittingsSharedPreferences
                          .saveViewedOutBoarding();
                    },
                    isVisibalIcon: true,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

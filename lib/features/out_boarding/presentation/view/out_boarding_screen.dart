import 'package:flutter/material.dart';
import '/core/constants.dart';
import '/core/resources/managar_font_size.dart';
import '/core/resources/manager_assets.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
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
  late PageController _pageController;
  final AppSettingsSharedPreferences _appSittingsSharedPreferences =
      AppSettingsSharedPreferences();
  int _cuttentpageindex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          leading: Visibility(
              visible: isNotFirstPage(),
              child: IconButton(
                onPressed: () {
                  _pageController.previousPage(
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
                visible: isNotLastPage(),
                replacement: TextButton(
                  onPressed: () {
                    _appSittingsSharedPreferences.saveViewedOutBoarding();
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
                    _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: ManagerConestant.pageViewSliderDuration,
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
                  controller: _pageController,
                  onPageChanged: (int value) {
                    setState(() {
                      _cuttentpageindex = value;
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
                      color: isFirstPage()
                          ? ManagerColors.grey
                          : ManagerColors.prossColor,
                      width:
                          isFirstPage() ? ManagerWeight.w20 : ManagerWeight.w8),
                  SizedBox(
                    width: ManagerWeight.w10,
                  ),
                  progressIndicator(
                      color: isSecondPage()
                          ? ManagerColors.grey
                          : ManagerColors.prossColor,
                      width: isSecondPage()
                          ? ManagerWeight.w20
                          : ManagerWeight.w8),
                  SizedBox(
                    width: ManagerWeight.w10,
                  ),
                  progressIndicator(
                      color: isThirdPage()
                          ? ManagerColors.grey
                          : ManagerColors.prossColor,
                      width:
                          isThirdPage() ? ManagerWeight.w20 : ManagerWeight.w8),
                  SizedBox(
                    width: ManagerWeight.w10,
                  ),
                  progressIndicator(
                      color: isLastPage()
                          ? ManagerColors.grey
                          : ManagerColors.prossColor,
                      width:
                          isLastPage() ? ManagerWeight.w20 : ManagerWeight.w8),
                ],
              ),
              SizedBox(
                height: ManagerHeight.h50,
              ),
              Visibility(
                visible: isLastPage(),
                replacement: base_button(
                  textStyle: const TextStyle(
                    color: ManagerColors.white,
                  ),
                  title: ManagerStrings.skip,
                  onPreessed: () {
                    _pageController.animateToPage(
                        ManagerConestant.LastPageindex,
                        duration: const Duration(
                            microseconds: ManagerConestant.Durationoutbording),
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
                    _appSittingsSharedPreferences.saveViewedOutBoarding();
                  },
                  isVisibalIcon: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isNotFirstPage() {
    return _cuttentpageindex != 0;
  }

  bool isFirstPage() {
    return _cuttentpageindex == 0;
  }

  bool isSecondPage() {
    return _cuttentpageindex == 1;
  }

  bool isThirdPage() {
    return _cuttentpageindex == 2;
  }

  bool isLastPage() {
    return _cuttentpageindex == 3;
  }

  bool isNotLastPage() {
    return _cuttentpageindex != 3;
  }
}

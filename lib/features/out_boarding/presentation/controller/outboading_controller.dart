import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';

class OutBoardingController extends GetxController {
  late PageController pageController;
  final AppSettingsSharedPreferences appSittingsSharedPreferences =
      AppSettingsSharedPreferences();
  int cuttentpageindex = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool isNotFirstPage() {
    return cuttentpageindex != 0;
  }

  bool isFirstPage() {
    return cuttentpageindex == 0;
  }

  bool isSecondPage() {
    return cuttentpageindex == 1;
  }

  bool isThirdPage() {
    return cuttentpageindex == 2;
  }

  bool isLastPage() {
    return cuttentpageindex == 3;
  }

  bool isNotLastPage() {
    return cuttentpageindex != 3;
  }
}

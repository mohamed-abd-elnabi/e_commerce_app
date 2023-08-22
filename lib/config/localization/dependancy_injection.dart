import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';

import '../../features/auth/presentation/controller/auth_controller.dart';

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();
}

initAuth() async {
  Get.put<AuthController>(AuthController());
}

disposeAuth() async {
  Get.delete<AuthController>();
}

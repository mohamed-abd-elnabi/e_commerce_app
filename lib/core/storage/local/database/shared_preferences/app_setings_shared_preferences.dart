import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';

class AppSittingsSharedPreferences {
  static final _instanse = AppSittingsSharedPreferences._internul();
  late SharedPreferences _sharedPreferences;
  AppSittingsSharedPreferences._internul();

  factory AppSittingsSharedPreferences() {
    return _instanse;
  }
  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveViewedOutBoarding() async {
    await _sharedPreferences.setBool(keyConestant.outBoardingViewedKey, true);
  }

  bool get outBoardingViewed =>
      _sharedPreferences.getBool(keyConestant.outBoardingViewedKey).onNull();
}

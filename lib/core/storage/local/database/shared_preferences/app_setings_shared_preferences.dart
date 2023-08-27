import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';

class AppSettingsSharedPreferences {
  static final _instance = AppSettingsSharedPreferences._internal();
  late SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences._internal();

  factory AppSettingsSharedPreferences() {
    return _instance;
  }

  clear() {
    _sharedPreferences.clear();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

//////
  Future<void> saveViewedOutBoarding() async {
    await _sharedPreferences.setBool(keyConestant.outBoardingViewedKey, true);
  }

  bool get outBoardingViewed =>
      _sharedPreferences.getBool(keyConestant.outBoardingViewedKey).onNull();

//////
  Future<void> setDefaultLocale(String lang) async {
    await _sharedPreferences.setString(keyConestant.localeKey, lang);
  }

  String get defaultLocale =>
      _sharedPreferences.getString(keyConestant.localeKey).parseLocale();

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(keyConestant.token, token);
  }

  String get defaultToken =>
      _sharedPreferences.getString(keyConestant.token).onNull();

  bool get loggedIn =>
      _sharedPreferences.getBool(keyConestant.loggedIn).onNull();
  Future<void> setLoggedIn() async {
    await _sharedPreferences.setBool(keyConestant.loggedIn, true);
  }
}

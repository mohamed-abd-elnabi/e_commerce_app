import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';
import 'package:shop_avatar/features/auth/presentation/model/login_model.dart';

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

//////////////////////////////////////////////////////////////

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

  Future<void> saveUserInfo(User user) async {
    await _sharedPreferences.setInt(
      keyConestant.userId,
      user.id,
    );
    await _sharedPreferences.setString(
      keyConestant.userName,
      user.name,
    );
    await _sharedPreferences.setString(
      keyConestant.userType,
      user.type,
    );
    await _sharedPreferences.setString(
      keyConestant.userEmail,
      user.email,
    );
    await _sharedPreferences.setString(
      keyConestant.userAvatar,
      user.avatar,
    );
    await _sharedPreferences.setString(
      keyConestant.userAvatarOriginal,
      user.avatarOriginal,
    );
    await _sharedPreferences.setString(
      keyConestant.userPhone,
      user.phone,
    );
  }

  User getUserInfo() {
    final int userId = _sharedPreferences.getInt(keyConestant.userId).onNull();
    final String userName =
        _sharedPreferences.getString(keyConestant.userName).onNull();
    final String userType =
        _sharedPreferences.getString(keyConestant.userType).onNull();
    final String userEmail =
        _sharedPreferences.getString(keyConestant.userEmail).onNull();
    final String userAvatar =
        _sharedPreferences.getString(keyConestant.userAvatar).onNull();
    final String userAvatarOriginal =
        _sharedPreferences.getString(keyConestant.userAvatarOriginal).onNull();
    final String userPhone =
        _sharedPreferences.getString(keyConestant.userPhone).onNull();

    return User(
      id: userId,
      name: userName,
      type: userType,
      email: userEmail,
      avatar: userAvatar,
      avatarOriginal: userAvatarOriginal,
      phone: userPhone,
    );
  }

  //////////////////////////////////////////////////////
  Future<void> setAppTheme(String theme) async {
    await _sharedPreferences.setString(
        ManagerConestant.preferencesKeyTheme, theme);
  }

  String getAppTheme() {
    return _sharedPreferences
        .getString(ManagerConestant.preferencesKeyTheme)
        .toString();
  }
}

class ManagerConestant {
  static const int SplachTime = 4;
  static const double elevationAppbar = 0;
  static const double letterSpacing3 = 3;
  static const int LastPageindex = 3;
  static const double paddingpage = 28;
  static const int pageViewSliderDuration = 600;
  static const int Durationoutbording = 5000;
  static const double letterSp5 = 5;
  static const double OpacityBgauthscreen = 0.7;
  static const double OpacityButtonauthscreen = 0.6;
  static const int timeSnackBar = 2;
  static const double letterSpacingWithSignInText = 2;
  static const double designDeviceWidth = 375;
  static const double designDeviceHeight = 812;
  static const String preferencesKeyTheme = 'theme_key';
  static const String dark = 'dark';
  static const String light = 'light';
  static const String notificationChannel = 'App_Name_Notifications_channel';
  static const String notificationChannelName = 'AppName Notifications Channel';
  static const String notificationChannelDescription =
      'This channel will receive notifications specific to the app';
  static const String notificationIconName = 'launch_background';
}

class keyConestant {
  static const String outBoardingViewedKey = 'out_boarding_viewed';
  static const String localeKey = 'locale_key';
  static const String arabic = 'ar';
  static const String english = 'en';
  static const String arabicName = 'العربية';
  static const String englishName = 'English';
  static const String token = 'token';
  static const String loggedIn = 'logged_in';
  static const String user = 'user';
  static const String userId = '${user}id';
  static const String userType = '${user}type';
  static const String userName = '${user}name';
  static const String userEmail = '${user}email';
  static const String userAvatar = '${user}avatar';
  static const String userAvatarOriginal = '${user}avatar_original';
  static const String userPhone = '${user}phone';
}

class ApiRequest {
  static const String baseUrl = 'http://e-commerce-selkroad.actit.ps';
  static const String api = '$baseUrl/api/v2';
  static const String apiAuth = '$api/auth';
  static const String login = '$apiAuth/login';
  static const String register = '$apiAuth/signup';
  static const String categories = '$api/categories';
  static const String home = '$api/products/home';
  static const String productDetails = '$api/products/{${ApiConstants.id}}';
  static const String forgetPasswordRequest =
      '${apiAuth}/password/forget_request';
}

class ApiConstants {
  static const String email = 'email';
  static const String password = 'password';
  static const String passwordConfirmation = 'password_confirmation';
  static const String authName = 'name';
  static const String phone = 'phone';
  static const String registerBy = 'register_by';
  static const String acceptLanguage = 'Accept-Language';
  static const String errorMassage = 'message';
  static const String accessToken = 'access_token';
  static const String bearer = 'Bearer';
  static const String authorization = 'Authorization';
  static const String id = 'id';
}

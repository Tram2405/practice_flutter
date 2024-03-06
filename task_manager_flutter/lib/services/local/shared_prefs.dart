import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String accessTokenKey = 'accessTokenKey';
  static const String checkAccessKey = 'checkAccess';

  static late SharedPreferences _prefs;

  static Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? get token {
    return _prefs.getString(accessTokenKey);
  }

  static set token(String? token) =>
      _prefs.setString(accessTokenKey, token ?? '');

  static removeSeason() {
    _prefs.remove(accessTokenKey);
  }

  static bool get isLogin =>
      _prefs.getString(accessTokenKey)?.isNotEmpty ?? false;

  //check onboarding

  static bool get isAccessed {
    return _prefs.getBool(checkAccessKey) ?? false;
  }

  static set isAccessed(bool value) => _prefs.setBool(checkAccessKey, value);
}

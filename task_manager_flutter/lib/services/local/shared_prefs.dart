import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String checkAccessKey = 'checkAccess';

  static late SharedPreferences _prefs;

  static Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //check onboarding
  static bool get isAccessed {
    return _prefs.getBool(checkAccessKey) ?? false;
  }

  static set isAccessed(bool value) => _prefs.setBool(checkAccessKey, value);
}

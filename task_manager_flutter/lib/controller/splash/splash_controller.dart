import 'dart:async';

import 'package:get/get.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/services/local/shared_prefs.dart';

class SplashController extends GetxController {
  void checkToken() {
    Timer(
      const Duration(milliseconds: 2600),
      () {
        if (SharedPrefs.isAccessed) {
          if (SharedPrefs.isLogin) {
            Get.offAllNamed(Routes.HOME_MANAGER);
          } else {
            Get.offAllNamed(Routes.LOGIN);
          }
        } else {
          Get.offAllNamed(Routes.ONBOARDING);
        }
      },
    );
  }
}

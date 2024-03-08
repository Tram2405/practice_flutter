import 'dart:async';

import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/user_model.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/services/local/shared_prefs.dart';

class SplashController extends GetxController {
  final AuthRepository authRepository;

  SplashController({required this.authRepository});
  final isProgress = true.obs;

  checkLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 2600));
    await authRepository.getUser().then((firebaseUser) {
      isProgress.value = false;
      if (SharedPrefs.isAccessed) {
        if (firebaseUser != null) {
          var user = UserModel(firebaseUser.email!, firebaseUser.displayName!);
          Get.offAllNamed(Routes.HOME_MANAGER, arguments: [user]);
        } else {
          Get.offAllNamed(Routes.LOGIN);
        }
      }else{
        Get.offAllNamed(Routes.ONBOARDING);
      }
    }).catchError((onError){
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}

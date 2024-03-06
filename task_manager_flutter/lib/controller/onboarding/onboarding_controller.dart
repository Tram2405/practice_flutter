import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/onboarding_model.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/services/local/shared_prefs.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  void changePage(int pageViewIndex) {
    currentIndex.value = pageViewIndex;
  }

  void onBack() {
    currentIndex.value--;
    pageController.jumpToPage(currentIndex.value);
  }

  void onNext() {
    if (currentIndex.value < onboardings.length - 1) {
      currentIndex.value++;
      pageController.jumpToPage(currentIndex.value);
    } else {
      SharedPrefs.isAccessed = true;
      Get.offAllNamed(Routes.REGISTER);
    }
  }
}

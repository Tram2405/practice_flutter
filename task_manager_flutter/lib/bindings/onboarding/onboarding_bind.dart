import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/onboarding/onboarding_controller.dart';

class OnBoardingBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }

}
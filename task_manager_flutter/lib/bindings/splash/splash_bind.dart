import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/splash/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut<SplashController>(() => SplashController());
  }

}
import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/home_manager_controller.dart';

class HomeManagerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeManagerController>(() => HomeManagerController());
  }

}
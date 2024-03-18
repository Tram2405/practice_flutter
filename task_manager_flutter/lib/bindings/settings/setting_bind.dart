import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/settings/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}

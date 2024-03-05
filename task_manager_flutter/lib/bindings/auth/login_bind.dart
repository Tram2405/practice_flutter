import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/auth/login_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}
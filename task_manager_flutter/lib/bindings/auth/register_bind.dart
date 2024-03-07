import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/auth/register_controller.dart';

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }

}
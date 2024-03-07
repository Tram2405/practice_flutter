import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/auth/forgot_password_controller.dart';

class ForgotPasswordBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
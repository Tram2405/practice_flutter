import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/auth/forgot_password_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(
            authRepository: AuthRepository(
          authService: AuthService(),
        )));
  }
}

import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/settings/change_password_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChangePasswordController(
        authRepository: AuthRepository(
          authService: AuthService(),
        ),
      ),
    );
  }
}

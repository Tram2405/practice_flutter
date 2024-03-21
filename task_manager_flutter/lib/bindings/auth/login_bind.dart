import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/auth/login_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service_provider.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        authRepository: AuthRepository(
          authService: AuthServiceProvider(),
        ),
      ),
    );
  }
}

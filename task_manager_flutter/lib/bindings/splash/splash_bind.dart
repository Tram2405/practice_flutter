import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/splash/splash_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        authRepository: AuthRepository(
          authService: AuthService(),
        ),
      ),
    );
  }
}

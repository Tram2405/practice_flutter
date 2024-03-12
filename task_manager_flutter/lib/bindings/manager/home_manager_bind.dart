import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/home_manager_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class HomeManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeManagerController>(
      () => HomeManagerController(
        authRepository: AuthRepository(
          authService: AuthService(),
        ),
      ),
    );
  }
}

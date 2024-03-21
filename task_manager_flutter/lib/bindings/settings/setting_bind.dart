import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/settings/setting_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service_provider.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SettingController(
        authRepository: AuthRepository(
          authService: AuthServiceProvider(),
        ),
      ),
    );
  }
}

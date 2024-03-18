import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/settings/edit_profile_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditProfileController(
        authRepository: AuthRepository(
          authService: AuthService(),
        ),
      ),
    );
  }
}

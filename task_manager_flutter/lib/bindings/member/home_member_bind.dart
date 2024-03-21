import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/member/home_member_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class HomeMemberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeMemberController(
        authRepository: AuthRepository(
          authService: AuthService(),
        ),
      ),
    );
  }
}

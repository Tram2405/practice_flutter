import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_user_controller.dart';
import 'package:task_manager_flutter/data/provider/user_provider.dart';
import 'package:task_manager_flutter/data/respository/user_repository.dart';

class AddUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddUserController(
        userRepository: UserRepository(
          userProvider: UserProvider(),
        ),
      ),
    );
  }
}

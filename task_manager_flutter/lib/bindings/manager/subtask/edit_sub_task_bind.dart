import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/subtask/edit_subtask_controller.dart';
import 'package:task_manager_flutter/data/provider/user_provider.dart';
import 'package:task_manager_flutter/data/respository/user_repository.dart';

class EditSubTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditSubTaskController(
        userRepository: UserRepository(
          userProvider: UserProvider(),
        ),
      ),
    );
  }
}

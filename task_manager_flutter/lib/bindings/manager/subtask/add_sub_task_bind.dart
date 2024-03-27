import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_sub_task_controller.dart';
import 'package:task_manager_flutter/data/provider/user_provider.dart';
import 'package:task_manager_flutter/data/respository/user_repository.dart';

class AddSubTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddSubTaskController(
        userRepository: UserRepository(
          userProvider: UserProvider(),
        ),
      ),
    );
  }
}

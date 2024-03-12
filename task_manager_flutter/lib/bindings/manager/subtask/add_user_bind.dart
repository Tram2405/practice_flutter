import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_user_controller.dart';

class AddUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddUserController());
  }
}

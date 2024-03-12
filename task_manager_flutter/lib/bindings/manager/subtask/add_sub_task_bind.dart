import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_sub_task_controller.dart';

class AddSubTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddSubTaskController());
  }
}

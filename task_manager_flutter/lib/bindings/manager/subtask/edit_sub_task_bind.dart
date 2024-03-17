import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/subtask/edit_subtask_controller.dart';

class EditSubTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditSubTaskController());
  }

}
import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/task/task_controller.dart';

class TaskBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<TaskController>(TaskController());
  }

}
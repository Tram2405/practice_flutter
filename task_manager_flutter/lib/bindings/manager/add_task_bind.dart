import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/add_task_controller.dart';

class AddTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddTaskController());
  }

}
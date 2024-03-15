import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/completed_task_controller.dart';

class CompletedTaskBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => CompletedTaskController());
  }

}
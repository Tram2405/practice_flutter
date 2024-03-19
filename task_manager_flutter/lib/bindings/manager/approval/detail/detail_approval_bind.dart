import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/completed/detail/detail_completed_task_controller.dart';

class DetailCompletedTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailCompletedTaskController());
  }
}

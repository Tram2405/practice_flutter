import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/subtask/detail_subtask_controller.dart';

class DetailSubTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailSubTaskController());
  }
}

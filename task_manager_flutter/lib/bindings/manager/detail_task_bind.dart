import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/detail_task_controller.dart';

class DetaiTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailTaskController());
  }

}
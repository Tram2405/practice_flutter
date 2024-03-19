import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/approval/approval_task_controller.dart';

class ApprovalTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApprovalTaskController());
  }

}
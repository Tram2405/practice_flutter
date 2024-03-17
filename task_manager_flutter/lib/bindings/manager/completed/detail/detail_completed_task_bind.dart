import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/approval/detail/detail_approval_controller.dart';

class DetailApprovalTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailApprovalController());
  }
}

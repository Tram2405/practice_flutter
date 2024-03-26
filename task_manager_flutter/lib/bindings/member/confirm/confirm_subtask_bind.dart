import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/member/confirm/confirm_subtask_controller.dart';

class ConfirmSubTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmSubTaskController());
  }

}
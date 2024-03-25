import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/member/completed/completed_member_controller.dart';

class CompletedMemberBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompletedMemberController());
  }

}
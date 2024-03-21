import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/member/completed/completed_member_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';

class CompletedMemberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CompletedMemberController(
        taskMemberRepository: TaskMemberRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}

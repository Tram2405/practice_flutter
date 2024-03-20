import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/member/task/task_member_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';

class TaskMemberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TaskMemberController(
        taskMemberRepository: TaskMemberRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}

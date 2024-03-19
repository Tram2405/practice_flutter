import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/approval/approval_task_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class ApprovalTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApprovalTaskController(taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),));
  }

}
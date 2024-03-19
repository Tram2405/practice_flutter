import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/completed/completed_task_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class CompletedTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CompletedTaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/task/task_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class TaskBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<TaskController>(
      TaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}

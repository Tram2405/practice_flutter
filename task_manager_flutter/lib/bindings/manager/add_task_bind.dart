import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/add_task_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class AddTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddTaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}

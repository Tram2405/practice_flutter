import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/task/detail/detail_task_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class DetaiTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailTaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}

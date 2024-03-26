import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class TaskController extends GetxController {
  final TaskRepository taskRepository;

  TaskController({required this.taskRepository});

  RxList<TaskModel> listTask = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTask();
  }

 Future<void> getTask() async {
    listTask.value = await taskRepository.getTasks();
  }

  void checkIdTaskUpdate(TaskModel? task) {
    if (task == null) return;
    for (var e in listTask) {
      if (e.id == task.id) {
        e = task;
        return;
      }
    }
  }
}

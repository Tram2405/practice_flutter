import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> listTask = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTask();
  }

  getTask() {
    listTask.value = tasks;
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

import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> listTask = <TaskModel>[].obs;

  getTask() {
    listTask.value = tasks;
  }
}

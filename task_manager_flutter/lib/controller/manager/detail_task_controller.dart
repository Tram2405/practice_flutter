import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class DetailTaskController extends GetxController {
  Rx<TaskModel> task = TaskModel().obs;


  void getSubTask(TaskModel subTaskInit) {
    task.value = subTaskInit;
  }
}

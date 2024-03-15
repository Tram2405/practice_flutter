import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class CompletedTaskController extends GetxController{
  RxList<TaskModel> taskCompleteds = <TaskModel>[].obs;

  
  void getSubTaskConfirm() {
    taskCompleteds = tasks.where((e) => e.getPercentCompleted() == 100).toList().obs;
  }
  
}
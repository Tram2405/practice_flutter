import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class CompletedTaskController extends GetxController{
  final TaskRepository taskRepository;
  RxList<TaskModel> taskCompleteds = <TaskModel>[].obs;

  CompletedTaskController({required this.taskRepository});

  
  void getSubTaskConfirm() {
    taskCompleteds = taskRepository.getTasks().where((e) => e.getPercentCompleted() == 100).toList().obs;
  }
  
}
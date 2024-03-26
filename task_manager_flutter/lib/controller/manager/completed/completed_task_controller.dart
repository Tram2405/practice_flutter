import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class CompletedTaskController extends GetxController{
  final TaskRepository taskRepository;

  CompletedTaskController({required this.taskRepository});
  RxList<TaskModel> taskCompleteds = <TaskModel>[].obs;

  
  Future<void> getSubTaskConfirm() async {
    final tasks = await taskRepository.getTasks();
    taskCompleteds.value = tasks.where((e) => e.getPercentCompleted() == 100).toList();
  }
  
}
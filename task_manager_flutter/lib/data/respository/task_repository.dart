import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';

class TaskRepository{
 final TaskProvider taskProvider;

  TaskRepository({required this.taskProvider});

  List<TaskModel> getTasks() {
    return taskProvider.getTasks();
  }
}
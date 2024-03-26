import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';

class TaskRepository{
 final TaskProvider taskProvider;

  TaskRepository({required this.taskProvider});

 Future <List<TaskModel>> getTasks() async{
    return await taskProvider.getTasks();
  }
}
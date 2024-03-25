import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';

class TaskMemberRepository {
  final TaskProvider taskProvider;

  TaskMemberRepository({required this.taskProvider});

  Future<List<TaskModel>> getMyTasks(String myEmail) async {
    final tasks = await taskProvider.getTasks();
    List<TaskModel> myTasks = [];

    for (TaskModel task in tasks) {
      for (SubTaskModel subtask in task.subTasks) {
        if (myEmail == subtask.user?.email) {
          myTasks.add(task);
          break;
        }
      }
    }
    return myTasks;
  }
}

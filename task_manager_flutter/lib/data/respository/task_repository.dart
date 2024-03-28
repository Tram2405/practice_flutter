import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';

class TaskRepository {
  final TaskProvider taskProvider;

  TaskRepository({required this.taskProvider});

  Stream<QuerySnapshot> stream() {
    return taskProvider.tasksCollection
        .snapshots();
  }

  Future<List<TaskModel>> getTasks() async {
    return await taskProvider.getTasks();
  }

  Future<String> addTask(TaskModel task) async {
    try {
      await taskProvider.tasksCollection.add(task.toFirestore());
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> updateSubTask(
      {required String id, required List<SubTaskModel> subTasks}) async {
    try {
      await taskProvider.tasksCollection
          .doc(id)
          .update(TaskModel(subTasks: subTasks).toFirestore());
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }
}

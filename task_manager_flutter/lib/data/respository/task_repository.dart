import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';

class TaskRepository {
  final TaskProvider taskProvider;

  TaskRepository({required this.taskProvider});

  Stream<QuerySnapshot> stream() {
    return taskProvider.tasksCollection.snapshots();
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
      {required String id, required TaskModel task}) async {
    try {
      await taskProvider.tasksCollection
          .doc(id)
          .update(task.toFirestore());
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> removeTask({required String id}) async {
    try {
      await taskProvider.tasksCollection.doc(id).delete();
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }
}

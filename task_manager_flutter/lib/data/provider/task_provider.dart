import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class TaskProvider {
  CollectionReference tasksCollection =
      FirebaseFirestore.instance.collection('tasks');

  Future<List<TaskModel>> getTasks() async {
    final snapShot = await tasksCollection.get();
    final tasks = snapShot.docs
        .map((e) => TaskModel.fromFirestore(
            e as DocumentSnapshot<Map<String, dynamic>>))
        .toList();
    return tasks;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class TaskProvider {
  FirebaseFirestore collection = FirebaseFirestore.instance;
  Future<List<TaskModel>> getTasks() async {
    final snapShot = await collection.collection('tasks').get();
    final tasks = snapShot.docs.map((e) => TaskModel.fromFirestore(e)).toList();
    return tasks;
  }
}

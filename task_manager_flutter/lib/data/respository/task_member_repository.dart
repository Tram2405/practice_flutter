import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class TaskMemberRepository {
  final TaskProvider taskProvider;

  TaskMemberRepository({required this.taskProvider});

  List<TaskModel> getMyTasks(
      {required String myEmail, required List<TaskModel> tasks}) {
    List<TaskModel> myTasks = [];

    for (TaskModel task in tasks) {
      for (SubTaskModel subtask in task.subTasks ?? []) {
        if (myEmail == subtask.user?.email) {
          myTasks.add(task);
          break;
        }
      }
    }
    return myTasks;
  }

  List<FirebaseCollectionData> getMyDocument(
      {required String myEmail,
      required List<FirebaseCollectionData> documents}) {
    List<FirebaseCollectionData> docs = [];

    for (FirebaseCollectionData doc in documents) {
      for (SubTaskModel subtask in doc.task?.subTasks ?? []) {
        if (myEmail == subtask.user?.email &&
            subtask.status != StatusType.completed.name) {
          docs.add(doc);
          break;
        }
      }
    }
    return docs;
  }

  Stream<QuerySnapshot> stream() {
    return taskProvider.tasksCollection.snapshots();
  }
}

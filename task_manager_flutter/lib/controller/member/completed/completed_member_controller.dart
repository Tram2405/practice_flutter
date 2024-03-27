import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class CompletedMemberController extends GetxController {
  final TaskMemberRepository taskMemberRepository;

  CompletedMemberController({required this.taskMemberRepository});

  final userCurrent = FirebaseAuth.instance.currentUser;
  RxList<SubTaskModel> subTaskCompleted = <SubTaskModel>[].obs;
  RxList<TaskModel> taskCompleteds = <TaskModel>[].obs;

  Stream<QuerySnapshot> taskStream() {
    return taskMemberRepository.stream();
  }

  void getTaskCompleted(List<TaskModel> tasks) {
    tasks = taskMemberRepository.getMyTasks(
      myEmail: userCurrent?.email ?? '',
      tasks: tasks,
    );
    subTaskCompleted.clear();
    for (var task in tasks) {
      for (var subtask in task.subTasks) {
        if (subtask.status == StatusType.completed.name &&
            subtask.user?.email == userCurrent?.email) {
          subTaskCompleted.add(subtask);
          continue;
        }
      }
    }
  }

  void getSubTaskConfirm(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    List<DocumentData> documents = snapshot.data?.docs
            .map((e) => DocumentData()
              ..id = e.id
              ..task = TaskModel.fromJson(e.data() as Map<String, dynamic>))
            .toList() ??
        [];

    taskCompleteds.value = documents.map((e) => e.task ?? TaskModel()).toList();
    getTaskCompleted(taskCompleteds);
  }
}

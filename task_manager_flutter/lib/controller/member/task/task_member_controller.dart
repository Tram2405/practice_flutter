import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';

class TaskMemberController extends GetxController {
  final TaskMemberRepository taskMemberRepository;

  TaskMemberController({required this.taskMemberRepository});

  final userCurrent = FirebaseAuth.instance.currentUser;
  RxList<TaskModel> myTasks = <TaskModel>[].obs;

  Stream<QuerySnapshot> taskStream() {
    return taskMemberRepository.stream();
  }

  void getMyTask(List<DocumentData> documents) {
    final tasks = taskMemberRepository.getMyTasks(
        myEmail: userCurrent?.email ?? '',
        tasks: documents.map((e) => e.task ?? TaskModel()).toList());
    myTasks.value = tasks;
    print('object ${myTasks.length}');
  }
}

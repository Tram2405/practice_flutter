import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';

class TaskMemberController extends GetxController {
  final TaskMemberRepository taskMemberRepository;

  TaskMemberController({required this.taskMemberRepository});

  final userCurrent = FirebaseAuth.instance.currentUser;
  RxList<DocumentData> docs = <DocumentData>[].obs;

  Stream<QuerySnapshot> taskStream() {
    return taskMemberRepository.stream();
  }

  void getMyTask(List<DocumentData> documents) {
    docs.value = taskMemberRepository.getMyDocument(
      myEmail: userCurrent?.email ?? '',
      documents: documents,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';

class CompletedTaskController extends GetxController{
  final TaskRepository taskRepository;

  CompletedTaskController({required this.taskRepository});
  RxList<TaskModel> taskCompleteds = <TaskModel>[].obs;

  Stream<QuerySnapshot> taskStream() {
    return taskRepository.stream();
  }

  
  Future<void> getSubTaskConfirm(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) async {
    List<DocumentData> documents = snapshot.data?.docs
            .map((e) => DocumentData()
              ..id = e.id
              ..task = TaskModel.fromJson(e.data() as Map<String, dynamic>))
            .toList() ??
        [];

    taskCompleteds.value = documents.map((e) => e.task ?? TaskModel()).toList() ;
    taskCompleteds.value = taskCompleteds.where((e) => e.getPercentCompleted() == 100).toList();
  }
  
}
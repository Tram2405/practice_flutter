import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class ApprovalTaskController extends GetxController {
  final TaskRepository taskRepository;

  ApprovalTaskController({required this.taskRepository});

  RxList<TaskModel> taskConfirms = <TaskModel>[].obs;

  ///Get subtask status = confirm
  RxList<SubTaskModel> subTaskConfirms = <SubTaskModel>[].obs;

  Stream<QuerySnapshot> taskStream() {
    return taskRepository.stream();
  }

  Future<void> getTask(List<DocumentData> documents) async {
    taskConfirms.value = documents.map((e) => e.task ?? TaskModel()).toList();
  }

  void getSubTaskConfirm(TaskModel? task) {
    subTaskConfirms = (task?.subTasks ?? <SubTaskModel>[])
        .where((e) => e.status == StatusType.confirmation.name)
        .toList()
        .obs;
  }

  void updateSubTasks(String id, List<SubTaskModel> subTasks) {
    taskRepository.updateSubTask(id: id, subTasks: subTasks);
  }
}

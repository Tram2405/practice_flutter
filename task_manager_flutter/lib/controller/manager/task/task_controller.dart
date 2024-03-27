// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/dialog/tm_dialog.dart';
import 'package:task_manager_flutter/components/snackbar/tm_snackbar.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class TaskController extends GetxController {
  final TaskRepository taskRepository;

  TaskController({required this.taskRepository});

  RxList<FirebaseCollectionData> docs = <FirebaseCollectionData>[].obs;

  TextEditingController taskNameEditController = TextEditingController();
  TextEditingController taskDesEditController = TextEditingController();
  Stream<QuerySnapshot> taskStream() {
    return taskRepository.stream();
  }

  Future<void> getTask(AsyncSnapshot<QuerySnapshot> snapshot) async {
    List<FirebaseCollectionData> documents = snapshot.data?.docs
            .map((e) => FirebaseCollectionData()
              ..id = e.id
              ..task = TaskModel.fromJson(e.data() as Map<String, dynamic>))
            .toList() ??
        [];
    docs.value = documents
        .where((e) => (e.task?.getPercentCompleted() ?? 0) < 100)
        .toList();
  }

  Future<void> onSelectDropDown(
      BuildContext context, int value, FirebaseCollectionData doc) async {
    if (value == 0) {
      Get.toNamed(
        Routes.DETAIL_TASK,
        arguments: {
          'task': doc.task,
          'id': doc.id,
        },
      );
    } else if (value == 1) {
      TMDialog.editingDialog(
        context,
        title: 'Edit ',
        valueNameTask: doc.task?.nameTask ?? '',
        valueDescriptionTask: doc.task?.description ?? '',
        nameTaskType: doc.task?.typeTask ?? '',
        nameTaskController: taskNameEditController,
        descriptionController: taskDesEditController,
        action: (value) {
          if (doc.id != null) {
            doc.task?.nameTask = value.nameTask;
            doc.task?.description = value.description;
            doc.task?.typeTask = value.typeTask;
            taskRepository.updateSubTask(
              id: doc.id!,
              task: doc.task ?? TaskModel(),
            );
          }
        },
      );
    } else {
      if (doc.id != null) {
        String result = await taskRepository.removeTask(id: doc.id!);
        if (result == 'success') {
          TMSnackBar.tmSnackBarSuccess(context,
              titleSnackbar: AppLocalizations.of(context).txtDeleteTask);
        }
      }
    }
  }
}

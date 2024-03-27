// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/snackbar/tm_snackbar.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class DetailTaskController extends GetxController {
  final TaskRepository taskRepository;
  DetailTaskController({required this.taskRepository});

  Rx<TaskModel?> task = (Get.arguments?['task'] as TaskModel?).obs;

  String? id;

  String? emailUser;

  @override
  void onInit() {
    getEmailUser();
    getId();
    super.onInit();
  }

  getId() {
    try {
      id = Get.arguments['id'];
    } catch (e) {
      id = null;
    }
  }

  getEmailUser() {
    try {
      emailUser = Get.arguments['email'];
    } catch (e) {
      emailUser = null;
    }
  }

  void onSelectDropDown(
      BuildContext context, int value, SubTaskModel subTask, int index) async {
    if (value == 0) {
      Get.toNamed(
        Routes.DETAIL_SUB_TASK,
        arguments: [subTask],
      );
    } else if (value == 1) {
      Get.toNamed(
        Routes.EDIT_SUB_TASK,
        arguments: [subTask],
      )?.then<SubTaskModel?>(
        (value) {
          if (value != null) {
            task.value?.subTasks[index] = value;
            task.refresh();
            if (id != null) {
              taskRepository.updateSubTask(
                  id: id!, subTasks: task.value?.subTasks ?? []);
            }
          }
          return null;
        },
      );
    } else {
      task.value?.subTasks.remove(subTask);
      task.refresh();

      String result = '';
      if (id != null) {
        result = await taskRepository.updateSubTask(
          id: id!,
          subTasks: task.value?.subTasks ?? [],
        );
      }

      if (result == 'success') {
        TMSnackBar.tmSnackBarSuccess(
          context,
          titleSnackbar: AppLocalizations.of(context).btnSnackDelete,
        );
      } else {
        TMSnackBar.tmSnackBarSuccess(context, titleSnackbar: result);
      }
    }
  }

  addSubTask(BuildContext context, SubTaskModel value) async {
    task.value?.subTasks.add(value);
    task.refresh();

    String result = '';
    if (id != null) {
      result = await taskRepository.updateSubTask(
        id: id!,
        subTasks: task.value?.subTasks ?? [],
      );
    }

    if (result == 'success') {
      TMSnackBar.tmSnackBarSuccess(
        context,
        titleSnackbar: AppLocalizations.of(context).txtSnackbarAddSubbtask,
      );
    } else {
      TMSnackBar.tmSnackBarError(context, titleSnackbar: result);
    }
  }

  updateStatusSubTask(List<SubTaskModel> subTasks) async {
    if (id != null) {
      await taskRepository.updateSubTask(
        id: id!,
        subTasks: subTasks,
      );
    }
  }
}

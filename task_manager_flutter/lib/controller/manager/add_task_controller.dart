// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/snackbar/tm_snackbar.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/generated/l10n.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class AddTaskController extends GetxController {
  final TaskRepository taskRepository;
  AddTaskController({required this.taskRepository});

  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode descriptonFocusNode = FocusNode();

  ///Observable variable to listen for added subtasks
  RxList<SubTaskModel> subTaskAdds = <SubTaskModel>[].obs;

  ///Observable integer representing the current selected index for task type.
  RxInt currentIndex = 0.obs;

  ///An observable variable to test that can perform an action when the conditions are right
  RxBool canAction = false.obs;

  ///List of task types to choose from when adding a task
  RxList<TaskType> taskTypes = [
    TaskType.low,
    TaskType.medium,
    TaskType.high,
  ].obs;

  ///method checks if the fields are empty, to determine the canAction variable
  void checkIsEmpty() {
    canAction.value = !(taskNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        subTaskAdds.isEmpty);
  }

  ///Callback function to update the selected task type index
  onSelectedType(int index) {
    currentIndex.value = index;
  }

  ///Method to add a subtask to the list
  void addSubTask(SubTaskModel subTask) {
    subTaskAdds.add(subTask);
    checkIsEmpty();
  }

  ///Method to add a task to the list and return to the previous screen
  Future<void> addTask(BuildContext context) async {
    TaskModel task = TaskModel()
      ..typeTask = taskTypes[currentIndex.value].name
      ..nameTask = taskNameController.text
      ..description = descriptionController.text
      ..subTasks = subTaskAdds
      ..startDate = subTaskAdds[0].startDate;
    String result = await taskRepository.addTask(task);

    if (result == 'success') {
      TMSnackBar.tmSnackBarSuccess(
        context,
        titleSnackbar: S.of(context).txtSnackbarUpdate,
      );
    } else {
      TMSnackBar.tmSnackBarError(context, titleSnackbar: result);
    }
    Get.back();
  }

  void onSelectDropDown(int value, SubTaskModel subTask, int index) {
    if (value == 0) {
      Get.toNamed(
        Routes.DETAIL_SUB_TASK,
        arguments: [subTask],
      );
    } else if (value == 1) {
      Get.toNamed(
        Routes.EDIT_SUB_TASK,
        arguments: [subTask],
      )?.then((value) {
        if (value != null) {
          subTaskAdds[index] = value;
        }
        return null;
      });
    } else {
      subTaskAdds.remove(subTask);
      checkIsEmpty();
    }
  }
}

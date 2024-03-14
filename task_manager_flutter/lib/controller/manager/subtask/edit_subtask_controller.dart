import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/date_time/tm_choose_date_time.dart';
import 'package:task_manager_flutter/controller/manager/detail_task_controller.dart';
import 'package:task_manager_flutter/controller/manager/task_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';

class EditSubTaskController extends GetxController {
  TextEditingController subTaskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<AppUserModel?> userSelect = Rx(null);
  String status = '';
  Rx<String?> startDate = Rx(null);
  Rx<String?> dueDate = Rx(null);
  RxBool canAction = false.obs;

  int index = Get.arguments[1];

  void getSubTask(SubTaskModel subTask) {
    startDate.value = subTask.startDate;
    dueDate.value = subTask.dueDate;
    userSelect.value = subTask.user;
    subTaskNameController.text = subTask.subTaskName ?? '';
    descriptionController.text = subTask.description ?? '';
    status = subTask.status ?? '';
  }

  void chooseStartDate(BuildContext context) async {
    startDate.value =
        await ChooseDateTime.pickDateTime(context) ?? startDate.value;
  }

  void chooseDueDate(BuildContext context) async {
    dueDate.value = await ChooseDateTime.pickDateTime(context) ?? dueDate.value;
  }

  void assignUser(AppUserModel user) {
    userSelect.value = user;
    checkIsEmpty();
  }

  void onDeleteUser() {
    userSelect.value = null;
    checkIsEmpty();
  }

  void checkIsEmpty() {
    canAction.value = !(userSelect.value == null ||
        subTaskNameController.text.isEmpty ||
        descriptionController.text.isEmpty);
  }

  void updateSubTask() {
    SubTaskModel subTask = SubTaskModel()
      ..status = status
      ..subTaskName = subTaskNameController.text
      ..description = descriptionController.text
      ..startDate = startDate.value
      ..dueDate = dueDate.value
      ..user = userSelect.value;

    // final detaiTaskController = Get.find<DetailTaskController>();
    // List<SubTaskModel> subTasks = detaiTaskController.task.value.subTasks ?? [];
    // subTasks[index] = subTask;

    // detaiTaskController.task.value = detaiTaskController.task.value.copyWith(
    //   subTasks: subTasks,
    // );

    Get.back(result: subTask);
  }
}

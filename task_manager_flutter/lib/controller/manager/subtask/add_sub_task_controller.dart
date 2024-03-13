import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/date_time/tm_choose_date_time.dart';
import 'package:task_manager_flutter/controller/manager/add_task_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class AddSubTaskController extends GetxController {
  TextEditingController subTaskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<AppUserModel?> userSelect = Rx(null);

  Rx<String?> startDate = Rx(null);
  Rx<String?> dueDate = Rx(null);
  RxBool canAction = false.obs;

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

  void addSubTask() {
    SubTaskModel subTask = SubTaskModel()
      ..subTaskName = subTaskNameController.text
      ..description = descriptionController.text
      ..user = userSelect.value
      ..startDate = startDate.value
      ..dueDate = dueDate.value
      ..status = StatusType.newTask.name;

    final addTaskController = Get.find<AddTaskController>();

    addTaskController.subTaskAdds.value = [
      ...addTaskController.subTaskAdds,
      subTask
    ];
    Get.back();
  }

  void onDeleteUser() {
    userSelect.value = null;
    checkIsEmpty();
  }

  void checkIsEmpty() {
    canAction.value = !(startDate.value == null ||
        dueDate.value == null ||
        userSelect.value == null ||
        subTaskNameController.text.isEmpty ||
        descriptionController.text.isEmpty);
  }
}

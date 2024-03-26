import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/date_time/tm_choose_date_time.dart';
import 'package:task_manager_flutter/components/snackbar/tm_snackbar.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';

class EditSubTaskController extends GetxController {
  TextEditingController subTaskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ///Observable for holding the selected user
  Rx<AppUserModel?> userSelect = Rx(null);

  ///the status of the subtask
  String status = '';

  ///Observables for start and due dates of the subtask
  Rx<String?> startDate = Rx(null);
  Rx<String?> dueDate = Rx(null);

  ///An observable variable to test that can perform an action when the conditions are right
  RxBool canAction = false.obs;

  ///Get subtask information and fill in the fields to edit the subtask
  void getSubTask(SubTaskModel subTask) {
    startDate.value = subTask.startDate;
    dueDate.value = subTask.dueDate;
    userSelect.value = subTask.user;
    subTaskNameController.text = subTask.subTaskName ?? '';
    descriptionController.text = subTask.description ?? '';
    status = subTask.status ?? '';
  }

  ///method choose start date
  void chooseStartDate(BuildContext context) async {
    startDate.value = await ChooseDateTime.pickDateTime(
          context,
          firstDate: DateTime.parse(
            startDate.value ?? DateTime.now().toString(),
          ),
          lastDate: DateTime.parse(
            dueDate.value ?? DateTime.now().toString(),
          ),
        ) ??
        startDate.value;
  }

  ///method choose due date
  void chooseDueDate(BuildContext context) async {
    dueDate.value = await ChooseDateTime.pickDateTime(
          context,
          firstDate: DateTime.parse(
            startDate.value ?? DateTime.now().toString(),
          ),
          lastDate: DateTime(2030),
        ) ??
        dueDate.value;
  }

  ///Method to assign a user to the subtask
  void assignUser(AppUserModel user) {
    userSelect.value = user;
    checkIsEmpty();
  }

  ///Method to remove the assigned user from the subtask
  void onDeleteUser() {
    userSelect.value = null;
    checkIsEmpty();
  }

  ///Method to check if any of the input fields is empty and updates canAction value
  void checkIsEmpty() {
    canAction.value = !(userSelect.value == null ||
        subTaskNameController.text.isEmpty ||
        descriptionController.text.isEmpty);
  }

  ///Method to update the subtask with the modified details and return to the previous screen.
  void updateSubTask(BuildContext context) {
    SubTaskModel subTask = SubTaskModel()
      ..status = status
      ..subTaskName = subTaskNameController.text
      ..description = descriptionController.text
      ..startDate = startDate.value
      ..dueDate = dueDate.value
      ..user = userSelect.value;
    Get.back(result: subTask);
  }
}

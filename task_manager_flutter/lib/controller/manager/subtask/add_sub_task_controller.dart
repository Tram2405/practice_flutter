import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/date_time/tm_choose_date_time.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';

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

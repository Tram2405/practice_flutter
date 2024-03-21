import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/message_model.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class DetailApprovalController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  RxBool canAction = false.obs;

  Rx<SubTaskModel> subTask = (Get.arguments[0] as SubTaskModel).obs;
  final userCurrent = FirebaseAuth.instance.currentUser;

  checkIsEmpty() {
    canAction.value = descriptionController.text.isNotEmpty;
  }

  addMessage() {
    final message = MessageModel(
        email: userCurrent?.email,
        message: descriptionController.text,
        isManagerMessage: true);
    subTask.value.messages.add(message);
    subTask.value.status = StatusType.error.name;
    descriptionController.clear();
    checkIsEmpty();
    subTask.refresh();
  }
}

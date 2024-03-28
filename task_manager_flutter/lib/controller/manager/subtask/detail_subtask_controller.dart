import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/message_model.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class DetailSubTaskController extends GetxController {
  Rx<SubTaskModel> subTask = (Get.arguments[0] as SubTaskModel).obs;

  String getTextButton(BuildContext context, String status) {
    if (status == StatusType.newTask.name) {
      return AppLocalizations.of(context).txtInProgress;
    } else if (status == StatusType.inProgress.name) {
      return AppLocalizations.of(context).txtConfirmation;
    } else if (status == StatusType.error.name) {
      return AppLocalizations.of(context).txtConfirmation;
    } else {
      return AppLocalizations.of(context).btnWaitResponse;
    }
  }

  void action() {
    if (subTask.value.status == StatusType.newTask.name) {
      subTask.value.status = StatusType.inProgress.name;
      
      Get.back(result: subTask);
    } else if (subTask.value.status == StatusType.inProgress.name ||
        subTask.value.status == StatusType.error.name) {
      Get.toNamed(Routes.CONFIRM_SUB_TASK_MEMBER)?.then<String?>(
        (value) {
          final userCurrent = FirebaseAuth.instance.currentUser;
          if (value != null) {
            subTask.value.status = StatusType.confirmation.name;
            final message = MessageModel(
              email: userCurrent?.email ?? '',
              avatar: subTask.value.user?.avatar,
              message: value,
              isManagerMessage: false,
            );
            subTask.value.messages.add(message);
            subTask.refresh();
          }
          return;
        },
      );
    }
  }
}

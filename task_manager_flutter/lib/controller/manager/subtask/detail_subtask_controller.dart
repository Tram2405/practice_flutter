import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class DetailSubTaskController extends GetxController {
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

  void action(SubTaskModel subTask) {
    if (subTask.status == StatusType.newTask.name) {
      subTask.status = StatusType.inProgress.name;
    } else if (subTask.status == StatusType.inProgress.name) {
      subTask.status = StatusType.confirmation.name;
    } else if (subTask.status == StatusType.error.name) {
      subTask.status = StatusType.confirmation.name;
    }
    Get.back(result: subTask);
  }
}

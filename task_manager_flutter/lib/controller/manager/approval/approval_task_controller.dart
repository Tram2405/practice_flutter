import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class ApprovalTaskController extends GetxController {
  RxList<TaskModel> taskConfirms = tasks.obs;

  ///Get subtask status = confirm
  RxList<SubTaskModel> subTaskConfirms = <SubTaskModel>[].obs;

  void getSubTaskConfirm(TaskModel? task) {
    subTaskConfirms = (task?.subTasks ?? <SubTaskModel>[])
        .where((e) => e.status == StatusType.confirmation.name)
        .toList()
        .obs;
  }
}

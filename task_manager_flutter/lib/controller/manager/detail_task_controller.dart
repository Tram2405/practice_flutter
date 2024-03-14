import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class DetailTaskController extends GetxController {
  Rx<TaskModel> task = TaskModel().obs;

  void getSubTask(TaskModel subTaskInit) {
    task.value = subTaskInit;
  }

  void onSelectDropDown(int value, SubTaskModel subTask, int index) {
    if (value == 0) {
      Get.toNamed(Routes.DETAIL_SUB_TASK, arguments: [subTask]);
    } else if (value == 1) {
      Get.toNamed(Routes.EDIT_SUB_TASK, arguments: [subTask])
          ?.then<SubTaskModel?>((value) {
        if (value != null) {
          task.value.subTasks[index] = value;
        }
        return null;
      });
    } else {
      task.value.subTasks.remove(subTask);
    }
  }
}

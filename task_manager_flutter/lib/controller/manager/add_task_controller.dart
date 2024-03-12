import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class AddTaskController extends GetxController {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxList<SubTaskModel> subTaskAdds = <SubTaskModel>[].obs;
  RxInt currentIndex = 0.obs;
  RxBool canAction = false.obs;

  TaskModel taskAdd = TaskModel();

  RxList<TaskType> taskTypes = [
    TaskType.low,
    TaskType.medium,
    TaskType.high,
  ].obs;

  void checkIsEmpty() {
    canAction.value = !(taskNameController.text.isEmpty ||
        descriptionController.text.isEmpty);
  }

  onSelectedType(int index) {
    currentIndex.value = index;
  }
}

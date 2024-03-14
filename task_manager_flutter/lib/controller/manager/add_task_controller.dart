import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class AddTaskController extends GetxController {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ///Observable variable to listen for added subtasks
  RxList<SubTaskModel> subTaskAdds = <SubTaskModel>[].obs;

  ///Observable integer representing the current selected index for task type.
  RxInt currentIndex = 0.obs;

  ///An observable variable to test that can perform an action when the conditions are right
  RxBool canAction = false.obs;

  ///List of task types to choose from when adding a task
  RxList<TaskType> taskTypes = [
    TaskType.low,
    TaskType.medium,
    TaskType.high,
  ].obs;

  ///method checks if the fields are empty, to determine the canAction variable
  void checkIsEmpty() {
    canAction.value = !(taskNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        subTaskAdds.isEmpty);
  }

  ///Callback function to update the selected task type index
  onSelectedType(int index) {
    currentIndex.value = index;
  }

  ///Method to add a subtask to the list
  void addSubTask(SubTaskModel subTask) {
    subTaskAdds.add(subTask);
    checkIsEmpty();
  }

  ///Method to add a task to the list and return to the previous screen
  void addTask() {
    TaskModel task = TaskModel()
      ..typeTask = taskTypes[currentIndex.value].name
      ..nameTask = taskNameController.text
      ..description = descriptionController.text
      ..subTasks = subTaskAdds
      ..startDate = subTaskAdds[0].startDate;

    Get.back(result: task);
  }
}

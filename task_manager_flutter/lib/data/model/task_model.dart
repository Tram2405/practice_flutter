import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class TaskModel {
  String? id;
  String? typeTask;
  String? nameTask;
  String? description;
  String? startDate;
  String? dueDate;
  int? numberFile;
  int? numberComment;
  RxList<SubTaskModel> subTasks = RxList();

  TaskModel();

  TaskModel copyWith({
    String? id,
    String? typeTask,
    String? nameTask,
    String? description,
    String? startDate,
    String? dueDate,
    List<SubTaskModel>? subTasks,
  }) {
    return TaskModel()
      ..id = id ?? this.id
      ..typeTask = typeTask ?? this.typeTask
      ..nameTask = nameTask ?? this.nameTask
      ..description = description ?? this.description
      ..startDate = startDate ?? this.startDate
      ..dueDate = dueDate ?? this.dueDate
      ..subTasks.value = subTasks ?? this.subTasks;
  }

  double getPercentCompleted() {
    double total = 0;
    double percentMember = 100 / (subTasks.length ?? 1);
    for (SubTaskModel subTask in subTasks ?? []) {
      if (subTask.status == StatusType.completed.name) {
        total = total + percentMember;
      }
    }
    return total;
  }
}

List<TaskModel> tasks = [
  TaskModel()
    ..id = '1'
    ..typeTask = TaskType.high.name
    ..nameTask = 'Design NFT landing page shot'
    ..description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut..."
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-23T02:03:48.467Z'
    ..numberFile = 2
    ..numberComment = 5
    ..subTasks.value = [
      subTasks[0],
      subTasks[1],
    ],
  TaskModel()
    ..id = '2'
    ..typeTask = TaskType.low.name
    ..nameTask = 'Design NFT landing page shot'
    ..description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut..."
    ..startDate = '2023-07-12T02:03:48.467Z'
    ..dueDate = '2023-07-24T02:03:48.467Z'
    ..numberFile = 3
    ..numberComment = 2
    ..subTasks.value = [
      subTasks[2],
      subTasks[3],
      subTasks[4],
    ],
  TaskModel()
    ..id = '3'
    ..typeTask = TaskType.medium.name
    ..nameTask = 'Design Figma'
    ..description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut..."
    ..startDate = '2023-06-11T02:03:48.467Z'
    ..dueDate = '2023-10-11T02:03:48.467Z'
    ..numberFile = 1
    ..numberComment = 4
    ..subTasks.value = [
      subTasks[5],
    ],
  TaskModel()
    ..id = '4'
    ..typeTask = TaskType.low.name
    ..nameTask = 'Design NFT landing page shot'
    ..description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut..."
    ..startDate = '2024-01-11T02:03:48.467Z'
    ..dueDate = '2024-01-11T02:03:48.467Z'
    ..numberFile = 1
    ..numberComment = 4
    ..subTasks.value = [
      subTasks[6],
    ],
  TaskModel()
    ..id = '5'
    ..typeTask = TaskType.medium.name
    ..nameTask = 'Design NFT landing page shot'
    ..description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut..."
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..numberFile = 3
    ..numberComment = 2
    ..subTasks.value = [
      subTasks[7],
    ],
];

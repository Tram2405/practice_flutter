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
  List<SubTaskModel> subTasks = [];

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
      ..subTasks = subTasks ?? this.subTasks;
  }

  double getPercentCompleted() {
    double total = 0;
    double percentMember = 100 / (subTasks.length);
    for (SubTaskModel subTask in subTasks) {
      if (subTask.status == StatusType.completed.name) {
        total = total + percentMember;
      }
    }
    return total;
  }
}

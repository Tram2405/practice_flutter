import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class TaskModel {
  String? id;
  String? typeTask;
  String? nameTask;
  String? description;
  String? startDate;
  int? numberFile;
  int? numberComment;
  List<SubTaskModel> subTasks = [];

  TaskModel({
    this.id,
    this.typeTask,
    this.nameTask,
    this.description,
    this.startDate,
    this.numberFile,
    this.numberComment,
    this.subTasks = const [],
  });

  factory TaskModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    final data = snapshot?.data();
    return TaskModel(
      id: data?['id'] ?? '',
      typeTask: data?['type_task'] ?? '',
      nameTask: data?['name_task'] ?? '',
      description: data?['description'] ?? '',
      startDate: data?['start_date'] ?? '',
      numberFile: data?['number_file'] ?? 0,
      numberComment: data?['number_comment'] ?? 0,
      subTasks: (data?['sub_tasks'] as List<dynamic>)
          .map((e) => SubTaskModel.fromJson(e))
          .toList(),
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? '',
      typeTask: json['type_task'] ?? '',
      nameTask: json['name_task'] ?? '',
      description: json['description'] ?? '',
      startDate: json['start_date'] ?? '',
      numberFile: json['number_file'] ?? 0,
      numberComment: json['number_comment'] ?? 0,
      subTasks: json['sub_tasks'] == null
          ? []
          : (json['sub_tasks'] as List<dynamic>)
              .map((e) => SubTaskModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (typeTask != null) "type_task": typeTask,
      if (nameTask != null) "name_task": nameTask,
      if (description != null) "description": description,
      if (startDate != null) "start_date": startDate,
      if (numberFile != null) "number_file": numberFile,
      if (numberComment != null) "number_comment": numberComment,
      "sub_tasks": subTasks.map((e) => e.toFirestore()).toList(),
    };
  }

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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/message_model.dart';

class SubTaskModel {
  String? id;
  String? subTaskName;
  String? description;
  AppUserModel? user;
  String? startDate;
  String? dueDate;
  String? status;
  List<MessageModel> messages = [];

  SubTaskModel({
    this.id,
    this.subTaskName,
    this.description,
    this.user,
    this.startDate,
    this.dueDate,
    this.status,
    this.messages = const [],
  });

  void removeUser() {
    user = null;
  }

  factory SubTaskModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    final data = snapshot?.data();
    return SubTaskModel(
        id: data?['id'] ?? '',
        subTaskName: data?['sub_task_name'] ?? '',
        description: data?['description'] ?? '',
        user: AppUserModel.fromFirestore(data?['user']),
        startDate: data?['start_date'],
        dueDate: data?['due_date'] ?? '',
        status: data?['status'] ?? '',
        messages: (data?['message'] as List<dynamic>)
            .map((e) => MessageModel.fromJson(e))
            .toList());
  }

  factory SubTaskModel.fromJson(Map<String, dynamic> json) {
    return SubTaskModel(
        id: json['id'] ?? '',
        subTaskName: json['sub_task_name'] ?? '',
        description: json['description'] ?? '',
        user: json['user'] == null ? null : AppUserModel.fromJson(json['user']),
        startDate: json['start_date'],
        dueDate: json['due_date'] ?? '',
        status: json['status'] ?? '',
        messages: json['messages'] == null
            ? []
            : (json['messages'] as List<dynamic>)
                .map((e) => MessageModel.fromJson(e))
                .toList());
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "sub_task_name": subTaskName,
      "description": description,
      "user": user?.toFirestore(),
      "start_date": startDate,
      "due_date": dueDate,
      "status": status,
      "messages": messages.map((e) => e.toFirestore()),
    };
  }
}

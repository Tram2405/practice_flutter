import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class SubTaskModel {
  String? id;
  String? subTaskName;
  String? description;
  AppUserModel? user;
  String? startDate;
  String? dueDate;
  String? status;

  SubTaskModel();
}

List<SubTaskModel> subTasks = [
  SubTaskModel()
    ..subTaskName = 'Code UI'
    ..description = 'UI & Navigator: Approval page, detail Approval page'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.newTask.name
    ..user = (AppUserModel()
      ..id = '1'
      ..name = 'Jemal'
      ..avatar = Assets.images.imgAvatarMember2.path),
  SubTaskModel()
    ..subTaskName = 'Design Figma'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.confirmation.name
    ..user = (AppUserModel()
      ..id = '2'
      ..name = 'Jack'
      ..avatar = Assets.images.imgAvatarMember4.path),
  SubTaskModel()
    ..subTaskName = 'Up'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.newTask.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Arslan'
      ..avatar = Assets.images.imgAvatarMember6.path),
  SubTaskModel()
    ..subTaskName = 'Code UI'
    ..description = 'UI & Navigator: Approval page, detail Approval page'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.completed.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Arslan'
      ..avatar = Assets.images.imgAvatarMember5.path),
  SubTaskModel()
    ..subTaskName = 'Design Figma'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.inProgress.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Arslan'
      ..avatar = Assets.images.imgAvatarMember4.path),
  SubTaskModel()
    ..subTaskName = 'Up' 
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.confirmation.name
    ..user = (AppUserModel()
      ..id = '2'
      ..name = 'Jack'
      ..avatar = Assets.images.imgAvatarMember3.path),
      SubTaskModel()
    ..subTaskName = 'Code UI'
    ..description = 'UI & Navigator: Approval page, detail Approval page'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.completed.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Arslan'
      ..avatar = Assets.images.imgAvatarMember2.path),
  SubTaskModel()
    ..subTaskName = 'Design Figma'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-05-11T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.inProgress.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Arslan'
      ..avatar = Assets.images.imgAvatarMember1.path),
];


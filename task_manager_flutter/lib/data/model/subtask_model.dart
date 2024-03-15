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

  SubTaskModel copyWith({
    String? id,
    String? subTaskName,
    String? description,
    AppUserModel? user,
    String? startDate,
    String? dueDate,
    String? status,
  }) {
    return SubTaskModel()
      ..id = id ?? this.id
      ..subTaskName = subTaskName ?? this.subTaskName
      ..description = description ?? this.description
      ..user = user ?? this.user
      ..startDate = startDate ?? this.startDate
      ..dueDate = dueDate ?? this.dueDate;
  }

  void removeUser() {
    user = null;
  }
}

List<SubTaskModel> subTasks = [
  SubTaskModel()
    ..id = '1'
    ..subTaskName = 'f UI'
    ..description = 'UI & Navigator: Approval page, detail Approval page'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.newTask.name
    ..user = (AppUserModel()
      ..id = '1'
      ..name = 'Jemal'
      ..avatar = Assets.images.imgAvatarMember2.path),
  SubTaskModel()
    ..id = '2'
    ..subTaskName = 'fffff Figma'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.confirmation.name
    ..user = (AppUserModel()
      ..id = '2'
      ..name = 'Jack'
      ..avatar = Assets.images.imgAvatarMember4.path),
  SubTaskModel()
    ..id = '3'
    ..subTaskName = 'Up'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.newTask.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Arslan'
      ..avatar = Assets.images.imgAvatarMember6.path),
  SubTaskModel()
    ..id = '4'
    ..subTaskName = 'cooo '
    ..description = 'UI & Navigator: Approval page, detail Approval page'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.completed.name
    ..user = (AppUserModel()
      ..id = '6'
      ..name = 'Berdiyev'
      ..avatar = Assets.images.imgAvatarMember6.path),
  SubTaskModel()
    ..id = '5'
    ..subTaskName = 'De'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.inProgress.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Arslan'
      ..avatar = Assets.images.imgAvatarMember4.path),
  SubTaskModel()
    ..id = '6'
    ..subTaskName = 'Up'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.confirmation.name
    ..user = (AppUserModel()
      ..id = '7'
      ..name = 'Merdan'
      ..avatar = Assets.images.imgAvatarMember3.path),
  SubTaskModel()
    ..id = '7'
    ..subTaskName = 'Code UI'
    ..description = 'UI & Navigator: Approval page, detail Approval page'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.completed.name
    ..user = (AppUserModel()
      ..id = '3'
      ..name = 'Merdan Berdiyev'
      ..avatar = Assets.images.imgAvatarMember3.path),
  SubTaskModel()
    ..id = '8'
    ..subTaskName = 'Design '
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.inProgress.name
    ..user = (AppUserModel()
      ..id = '5'
      ..name = 'Perhat'
      ..avatar = Assets.images.imgAvatarMember5.path),
];

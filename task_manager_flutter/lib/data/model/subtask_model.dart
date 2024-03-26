import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/message_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class SubTaskModel {
  String? id;
  String? subTaskName;
  String? description;
  AppUserModel? user;
  String? startDate;
  String? dueDate;
  String? status;
  List<MessageModel> messages = [];

  SubTaskModel();

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
      ..name = 'Trâm'
      ..email = 'tram123@gmail.com'
      ..avatar = 'https://i.pinimg.com/564x/44/cc/f8/44ccf87224a4733d37288b0d727c2ea0.jpg'),
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
      ..avatar = 'https://i.pinimg.com/564x/1d/f9/6e/1df96e458e6e10779de6f52cafd2d655.jpg'),
  SubTaskModel()
    ..id = '3'
    ..subTaskName = 'Up'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.newTask.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Trâm'
      ..email = 'tram123@gmail.com'
      ..avatar = 'https://i.pinimg.com/564x/4f/6b/44/4f6b4473a03eb0d219e0351b1315e18b.jpg'),
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
      ..avatar = 'https://i.pinimg.com/564x/6a/7a/e6/6a7ae6ffdbf8b25efa62872b4f071539.jpg'),
  SubTaskModel()
    ..id = '5'
    ..subTaskName = 'De'
    ..description = 'Add Task, SubTask...'
    ..startDate = '2023-04-10T02:03:48.467Z'
    ..dueDate = '2023-05-11T02:03:48.467Z'
    ..status = StatusType.inProgress.name
    ..user = (AppUserModel()
      ..id = '4'
      ..name = 'Trâm'
      ..email = 'tram123@gmail.com'
      ..avatar = 'https://i.pinimg.com/564x/4f/6b/44/4f6b4473a03eb0d219e0351b1315e18b.jpg'),
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
      ..avatar = 'https://i.pinimg.com/564x/28/f0/3d/28f03dbe2c0b7982a2658e5bb50123e8.jpg'),
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
      ..avatar = 'https://i.pinimg.com/564x/11/2f/1b/112f1b1758e9af56a75782bc942cb7d1.jpg'),
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
      ..avatar = 'https://i.pinimg.com/564x/11/2f/1b/112f1b1758e9af56a75782bc942cb7d1.jpg'),
];

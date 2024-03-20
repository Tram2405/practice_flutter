import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class TaskProvider {
  List<TaskModel> getTasks() {
    return [
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
        ..subTasks = [
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
        ..subTasks = [
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
        ..subTasks = [
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
        ..subTasks = [
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
        ..subTasks = [
          subTasks[7],
        ],
    ];
  }
}

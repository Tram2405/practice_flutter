import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class ApprovalTaskController extends GetxController {
  final TaskRepository taskRepository;


  ApprovalTaskController({required this.taskRepository});

  RxList<TaskModel> taskConfirms = <TaskModel>[].obs;

  
  ///Get subtask status = confirm
  RxList<SubTaskModel> subTaskConfirms = <SubTaskModel>[].obs;
  @override
  void onInit() {
    getTask();
    super.onInit();
  }

  Future<void> getTask ()async{
    taskConfirms.value =  await taskRepository.getTasks();
  }

  void getSubTaskConfirm(TaskModel? task) {
    subTaskConfirms = (task?.subTasks ?? <SubTaskModel>[])
        .where((e) => e.status == StatusType.confirmation.name)
        .toList()
        .obs;
  }
}

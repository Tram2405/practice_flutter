import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class CompletedMemberController extends GetxController {
  final TaskMemberRepository taskMemberRepository;

  CompletedMemberController({required this.taskMemberRepository});

  final userCurrent = FirebaseAuth.instance.currentUser;
  RxList<SubTaskModel> subTaskCompleted = <SubTaskModel>[].obs;

  @override
  onInit(){
    getTaskCompleted();
    super.onInit();
  }

  Future<void> getTaskCompleted()async {
    final tasks = await taskMemberRepository.getMyTasks(userCurrent?.email ?? '');
    for (var task in tasks) {
      for (var subtask in task.subTasks) {
        if (subtask.status == StatusType.completed.name && subtask.user?.email == userCurrent?.email) {
          subTaskCompleted.add(subtask);
          continue;
        }
      }
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';

class TaskMemberController extends GetxController {
  final TaskMemberRepository taskMemberRepository;

  TaskMemberController({required this.taskMemberRepository});

  final userCurrent = FirebaseAuth.instance.currentUser;
  RxList<TaskModel> myTasks = <TaskModel>[].obs;

  @override
  onInit() {
    getMyTask();
    super.onInit();
  }

  getMyTask() {
    myTasks.value = taskMemberRepository.getMyTasks(userCurrent?.email ?? '');
  }
}

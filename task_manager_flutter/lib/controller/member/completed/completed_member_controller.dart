import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';

class CompletedMemberController extends GetxController{
  
  final userCurrent = FirebaseAuth.instance.currentUser;
  RxList<SubTaskModel> subTaskCompleted = <SubTaskModel>[].obs;


}
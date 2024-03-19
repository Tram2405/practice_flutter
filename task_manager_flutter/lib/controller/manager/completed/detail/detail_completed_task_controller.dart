import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class DetailCompletedTaskController extends GetxController{
  Rx<TaskModel> task = (Get.arguments[0] as TaskModel).obs;
  
}
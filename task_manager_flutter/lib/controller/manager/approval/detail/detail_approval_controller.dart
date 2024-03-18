import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';

class DetailApprovalController extends GetxController {
  TextEditingController descriptionController = TextEditingController();

  SubTaskModel subTask = Get.arguments[0] as SubTaskModel;
}

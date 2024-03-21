import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmSubTaskController extends GetxController{

  TextEditingController descriptionController = TextEditingController();
  RxBool canAction = false.obs;

  checkIsEmpty(){
    canAction.value = descriptionController.text.isNotEmpty;
  }

  onDone(){
   Get.back(result: descriptionController.text);
  }
}
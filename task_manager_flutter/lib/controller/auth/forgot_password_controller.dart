import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxBool hasContent = false.obs;

  void isEmpty() {
    hasContent.value =
        FormValidator.validatorEmail(emailController.text) == null;
  }
}

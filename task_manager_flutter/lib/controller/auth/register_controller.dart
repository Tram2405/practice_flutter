import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();
  RxBool isTrue = false.obs;

  void isEmpty() {
    if (FormValidator.validatorRequired(nameController.text) == null &&
        FormValidator.validatorEmail(emailController.text) == null &&
        FormValidator.validatorPassword(passwordController.text) == null &&
        FormValidator.validatorConfirmPassword(
                retypePasswordController.text, passwordController.text) ==
            null) {
      isTrue.value = true;
    } else {
      isTrue.value = false;
    }
  }
}

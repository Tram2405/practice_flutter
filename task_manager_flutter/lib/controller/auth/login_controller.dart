import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isTrue = false.obs;

  void isEmpty(){
    if (FormValidator.validatorEmail(emailController.text) == null &&
        FormValidator.validatorPassword(passwordController.text) == null ) {
      isTrue.value = true;
    } else {
      isTrue.value =  false;
    }
  }
}

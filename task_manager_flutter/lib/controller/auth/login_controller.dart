import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool hasContent = false.obs;
  RxBool isShowPassword = false.obs;

  void isEmpty(){
    if (FormValidator.validatorEmail(emailController.text) == null &&
        FormValidator.validatorPassword(passwordController.text) == null ) {
      hasContent.value = true;
    } else {
      hasContent.value =  false;
    }
  }

  void changeStatePassword(){
    isShowPassword.value = !isShowPassword.value;
    
  }
}

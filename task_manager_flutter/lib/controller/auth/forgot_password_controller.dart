import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class ForgotPasswordController extends GetxController {
  final AuthRepository authRepository;

  ForgotPasswordController({required this.authRepository});

  TextEditingController emailController = TextEditingController();
  RxBool hasContent = false.obs;

  void isEmpty() {
    hasContent.value =
        FormValidator.validatorEmail(emailController.text) == null;
  }

  passwordReset(BuildContext context) async {
    await authRepository
        .passwordReset(context, email: emailController.text)
        .then((value) => {});
  }
}

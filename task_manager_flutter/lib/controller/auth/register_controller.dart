import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository;

  RegisterController({required this.authRepository});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  RxBool hasContent = false.obs;
  RxBool isShowPassword = false.obs;
  RxBool isShowRetypePassword = false.obs;
  RxBool isLoading = false.obs;

  void isEmpty() {
    hasContent.value =
        FormValidator.validatorRequired(nameController.text) == null &&
            FormValidator.validatorEmail(emailController.text) == null &&
            FormValidator.validatorPassword(passwordController.text) == null &&
            FormValidator.validatorConfirmPassword(
                    retypePasswordController.text, passwordController.text) ==
                null;
  }

  register(BuildContext context) async {
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    await authRepository
        .registration(
            fullName: nameController.text,
            email: emailController.text,
            password: passwordController.text)
        .then((registerMessage) {
      if (registerMessage == 'Success') {
        isLoading.value = false;
        Get.offAllNamed(Routes.LOGIN);
      } else {
        isLoading.value = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(registerMessage ?? '')));
      }
    });
  }
}

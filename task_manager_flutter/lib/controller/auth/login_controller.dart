import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;
  LoginController({required this.authRepository});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool hasContent = false.obs;
  RxBool isShowPassword = false.obs;
  RxBool isLoading = false.obs;
  final isProgress = true.obs;
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    try {
      emailController.text = Get.arguments[0].toString();
    } catch (e) {
      emailController.text = '';
    }
    super.onInit();
  }

  void isEmpty() {
    hasContent.value =
        FormValidator.validatorEmail(emailController.text) == null &&
            FormValidator.validatorPassword(passwordController.text) == null;
  }

  login(BuildContext context) async {
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    await authRepository
        .login(emailController.text, passwordController.text)
        .then(
      (loginMessage) {
        if (loginMessage == "Success") {
          isLoading.value = false;
          if (emailController.text == 'manager@gmail.com') {
            Get.offAllNamed(Routes.HOME_MANAGER);
          } else {
            Get.offAllNamed(Routes.HOME_MEMBER);
          }
        } else {
          isLoading.value = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                loginMessage ?? '',
              ),
            ),
          );
        }
      },
    );
  }
}

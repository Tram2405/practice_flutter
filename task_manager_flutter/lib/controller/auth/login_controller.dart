import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/user_model.dart';
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
  final isProgress = true.obs;
  final isLoggedIn = false.obs;

  void isEmpty() {
    if (FormValidator.validatorEmail(emailController.text) == null &&
        FormValidator.validatorPassword(passwordController.text) == null) {
      hasContent.value = true;
    } else {
      hasContent.value = false;
    }
  }

  void changeStatePassword() {
    isShowPassword.value = !isShowPassword.value;
  }

  login(BuildContext context) async {
    await authRepository
        .login(emailController.text, passwordController.text)
        .then((loginMessage) => {
              if (loginMessage == "Success")
                {
                  Get.offAllNamed(Routes.HOME_MANAGER),
                }
              else
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(loginMessage ?? '')))
                }
            });
  }

  checkLoggedIn() async {
    await authRepository.getUser().then((firebaseUser) {
      isProgress.value = false;
      if (firebaseUser != null) {
        var user = UserModel(firebaseUser.email!, firebaseUser.displayName!);
        Get.toNamed(Routes.HOME_MANAGER, arguments: [user]);
      }
    }).catchError((onError) {
      Get.toNamed(Routes.LOGIN);
    });
  }

  // Future<void> login(BuildContext context) async {
  //   String? message;
  //   try {
  //     await firebaseAuth.signInWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     String? token = await FirebaseMessaging.instance.getToken();
  //     SharedPrefs.token = token;

  //     Get.offAllNamed(Routes.HOME_MANAGER);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       message =  'No user found for that email';
  //     } else if (e.code == 'wrong-password') {
  //       message =  'Wrong password provided for that user';
  //     } else {
  //       message = e.message;
  //     }
  //   } catch (e) {
  //     message = e.toString();
  //   }

  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message ?? '')));
  // }
}

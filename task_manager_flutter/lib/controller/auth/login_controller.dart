import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/services/local/shared_prefs.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class LoginController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool hasContent = false.obs;
  RxBool isShowPassword = false.obs;

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

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      String? token = await FirebaseMessaging.instance.getToken();
      SharedPrefs.token = token;

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/snackbar/tm_snackbar.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class ChangePasswordController extends GetxController {
  final AuthRepository authRepository;

  ChangePasswordController({required this.authRepository});

  TextEditingController currentPasswordContoller = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController retypePassController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool canAction = false.obs;

  Future<void> changePassword(
      BuildContext context, String currentPassword, String newPassword) async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    String result = await authRepository.changePassword(
        currentPasswordContoller.text, newPassController.text);
    if (result == 'success') {
      TMSnackBar.tmSnackBarSuccess(context,
          titleSnackbar: 'Update profile successfully');
      isLoading.value = false;
      Get.back();
    } else {
      isLoading.value = false;
      TMSnackBar.tmSnackBarError(context, titleSnackbar: result);
    }
  }

  void checkIsEmpty() {
    canAction.value = !(currentPasswordContoller.text.isEmpty ||
        newPassController.text.isEmpty ||
        retypePassController.text.isEmpty);
  }
}

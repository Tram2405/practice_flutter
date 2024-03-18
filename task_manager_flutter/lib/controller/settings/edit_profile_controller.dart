
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/snackbar/tm_snackbar.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class EditProfileController extends GetxController {
  final AuthRepository authRepository;

  EditProfileController({required this.authRepository});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString emailCurrent = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    emailCurrent.value = authRepository.getEmailCurrentUser();
    super.onInit();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserByEmail() {
    return authRepository.getUserByEmail(emailCurrent.value);
  }

  Future<void> updateProfile(BuildContext context,
      {required String id}) async {
        isLoading.value = true;
    String resultUpdate =
        await authRepository.updateProfile(id, nameController.text);
    if (resultUpdate == 'success') {
      isLoading.value = false;
      // ignore: use_build_context_synchronously
      TMSnackBar.tmSnackBarSuccess(context, titleSnackbar: 'Update profile successfully');
      Get.back();
    } else {
      isLoading.value = false;
      // ignore: use_build_context_synchronously
      TMSnackBar.tmSnackBarError(context, titleSnackbar: resultUpdate);
    }
  }
}

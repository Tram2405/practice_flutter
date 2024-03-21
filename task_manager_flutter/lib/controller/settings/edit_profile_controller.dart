import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  RxString avatarPath = ''.obs;
  RxString? avatarUrl;
  RxBool isLoadAvatar = false.obs;

  final storage = FirebaseStorage.instance;

  @override
  void onInit() {
    emailCurrent.value = authRepository.getEmailCurrentUser();
    super.onInit();
  }

  // pick avatar
  void pickAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      isLoadAvatar.value = true;
      avatarPath.value = result.files.single.path!;

      final fileName = result.files.singleOrNull?.name;
      DateTime now = DateTime.now();

      Reference ref = FirebaseStorage.instance.ref().child(
          "avatar/${now.millisecondsSinceEpoch.toStringAsFixed(5)}$fileName");

      await ref.putFile(File(result.files.single.path!));

      ref.getDownloadURL().then((value) {
        avatarUrl?.value = value;

        isLoadAvatar.value = false;
      });
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserByEmail() {
    return authRepository.getUserByEmail(emailCurrent.value);
  }

  Future<void> updateProfile(BuildContext context, {required String id}) async {
    isLoading.value = true;
    String resultUpdate = await authRepository.updateProfile(
        id, nameController.text, avatarUrl?.value);
    if (resultUpdate == 'success') {
      isLoading.value = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        TMSnackBar.tmSnackBarSuccess(context,
            titleSnackbar: 'Update profile successfully');
      });
      Get.back();
    } else {
      isLoading.value = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        TMSnackBar.tmSnackBarError(context, titleSnackbar: resultUpdate);
      });
    }
  }
}

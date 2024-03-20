import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';

class SettingController extends GetxController {
  final AuthRepository authRepository;

  SettingController({required this.authRepository});

  RxString emailCurrent = ''.obs;
  RxBool isEmailTurnOn = false.obs;
  RxBool isNotification = false.obs;
  

  @override
  void onInit() {
    emailCurrent.value = authRepository.getEmailCurrentUser();
    super.onInit();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserByEmail(){
    return authRepository.getUserByEmail(emailCurrent.value);
  }
}

import 'package:get/get.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class HomeManagerController extends GetxController {
  final AuthRepository authRepository;

  HomeManagerController({required this.authRepository});

  RxInt currentIndex = 0.obs;

  logout() {
    authRepository.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  selectPage(int indexPage) {
    currentIndex.value = indexPage;
  }
}

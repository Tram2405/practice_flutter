import 'package:get/get.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class HomeMemberController extends GetxController {
  final AuthRepository authRepository;

  HomeMemberController({required this.authRepository});

  RxInt currentIndex = 0.obs;

  logout() {
    authRepository.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  selectPage(int indexPage) {
    currentIndex.value = indexPage;
  }
}

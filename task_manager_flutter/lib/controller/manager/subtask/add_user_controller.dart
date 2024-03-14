import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';

class AddUserController extends GetxController {
  RxList<AppUserModel> listSearch = users.obs;
  RxBool isSelect = false.obs;
  AppUserModel? userPick;

  void searchUser(String searchText) {
    listSearch.value = users
        .where((element) => (element.name ?? '')
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
  }

  void selectedUser(AppUserModel userSelect) {
    listSearch.map((element) => element.isCheck = false).toList();
    userSelect.isCheck = true;
  }
}

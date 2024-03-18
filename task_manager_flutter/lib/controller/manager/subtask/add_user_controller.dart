import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';

class AddUserController extends GetxController {

  ///Observable list for displaying search results
  RxList<AppUserModel> listSearch = users.obs;

  /// Observable boolean to track if a user is selected.
  AppUserModel? userPick;

  ///Method to search for users based on search text
  void searchUser(String searchText) {
    listSearch.value = users
        .where((element) => (element.name ?? '')
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
  }

  /// Method to mark a user as selected and unselect others.
  void selectedUser(AppUserModel userSelect) {
    listSearch.map((element) => element.isCheck = false).toList();
    userSelect.isCheck = true;
    listSearch.refresh();
  }
}

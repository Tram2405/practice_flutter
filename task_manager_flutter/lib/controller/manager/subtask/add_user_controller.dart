import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/respository/user_repository.dart';

class AddUserController extends GetxController {
  UserRepository userRepository;

  AddUserController({required this.userRepository});

  ///Observable list for displaying search results
  RxList<AppUserModel> listSearch = <AppUserModel>[].obs;

// RxList<AppUserModel> users = <AppUserModel>[].obs;
  /// Observable boolean to track if a user is selected.
  List<AppUserModel>? userPick;

  ///Observable for holding the selected user
  Rx<AppUserModel?> userSelect = Rx(null);

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void getUsers() async {
    final users = await userRepository.getUsers();
    listSearch.value = users;
    userPick = users;
  }

  ///Method to search for users based on search text
  void searchUser([String? name]) {
    listSearch.value = userPick
            ?.where((e) => (e.name ?? '').toLowerCase().contains(
                  name?.toLowerCase() ?? '',
                ))
            .toList() ??
        [];
  }

  ///Method to assign a user to the subtask
  void assignUser(AppUserModel user) {
    userSelect.value = user;
    listSearch.map((element) => element.isCheck = false).toList();
    user.isCheck = true;
    listSearch.refresh();
    update();
  }
}

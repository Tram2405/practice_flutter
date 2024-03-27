import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/date_time/tm_choose_date_time.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/respository/user_repository.dart';
import 'package:task_manager_flutter/utils/enum.dart';

class AddSubTaskController extends GetxController {
  UserRepository userRepository;
  AddSubTaskController({required this.userRepository});

  TextEditingController subTaskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ///Observable for holding the selected user
  Rx<AppUserModel?> userSelect = Rx(null);

  ///Observables for start and due dates of the subtask.
  Rx<String?> startDate = Rx(null);
  Rx<String?> dueDate = Rx(null);

  ///An observable variable to test that can perform an action when the conditions are right
  RxBool canAction = false.obs;

  ///Observable list for displaying search results
  RxList<AppUserModel> listSearch = <AppUserModel>[].obs;

// RxList<AppUserModel> users = <AppUserModel>[].obs;
  /// Observable boolean to track if a user is selected.
  List<AppUserModel>? userPick;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  ///method choose start date, firsDate: date now, last date: 2030
  ///if select null -> display start date
  void chooseStartDate(BuildContext context) async {
    startDate.value = await ChooseDateTime.pickDateTime(
          context,
          firstDate: DateTime.now(),
          lastDate: DateTime.parse(dueDate.value ?? DateTime(2030).toString()),
        ) ??
        startDate.value;
  }

  ///method choose due date, firsDate: date now, last date: 2030
  ///if select null -> display due date
  void chooseDueDate(BuildContext context) async {
    dueDate.value = await ChooseDateTime.pickDateTime(
          context,
          firstDate:
              DateTime.parse(startDate.value ?? DateTime.now().toString()),
          lastDate: DateTime(2030),
        ) ??
        dueDate.value;
  }

  ///Method to assign a user to the subtask
  void assignUser(AppUserModel user) {
    userSelect.value = user;
    listSearch.map((element) => element.isCheck = false).toList();
    user.isCheck = true;
    listSearch.refresh();
    update();
    checkIsEmpty();
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

  ///Method to add the subtask to the list and return to the previous screen
  void addSubTask() {
    SubTaskModel subTask = SubTaskModel()
      ..subTaskName = subTaskNameController.text
      ..description = descriptionController.text
      ..user = userSelect.value
      ..startDate = startDate.value
      ..dueDate = dueDate.value
      ..status = StatusType.newTask.name;

    Get.back(result: subTask);
  }

  ///Method to remove the assigned user from the subtask.
  void onDeleteUser() {
    userSelect.value = null;
    listSearch.map((element) => element.isCheck = false).toList();
    listSearch.refresh();
  }

  ///Method to check if any of the input fields is empty and updates canAction value
  void checkIsEmpty() {
    canAction.value = !(startDate.value == null ||
        dueDate.value == null ||
        userSelect.value == null ||
        subTaskNameController.text.isEmpty ||
        descriptionController.text.isEmpty);
  }

  void getUsers() async {
    final users = await userRepository.getUsers();
    listSearch.value = users;
    userPick = users;
  }
}

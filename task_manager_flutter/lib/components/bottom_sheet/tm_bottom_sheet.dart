import 'package:flutter/material.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/ui/manager/subtask/add_user.dart';

class TMBottomSheet {
  static void bottomSheetAddUser(BuildContext context, Function(AppUserModel) action) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, process) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: AddUser(
                onPressed: (userSelected) {
                  action.call(userSelected);
                  process(() {});
                },
              ),
            );
          },
        );
      },
    );
  }
}

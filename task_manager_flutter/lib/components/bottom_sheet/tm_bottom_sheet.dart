import 'package:flutter/material.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/ui/manager/subtask/add_user.dart';

///is a layer defining the bottom sheet functions in the application
class TMBottomSheet {
  ///[context] : BuildContext - Widget's current context.
  ///[action] : The callback function is called when users choose a user from the list.
  static void bottomSheetAddUser(
      BuildContext context, Function(AppUserModel) action) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        ///Create a stateful widget to update the bottom sheet appearance
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: AddUser(
            onPressed: (userSelected) {
              ///Call the Callback Action and user transmission
              action.call(userSelected);
            },
          ),
        );
      },
    );
  }
}

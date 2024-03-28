import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/ui/manager/subtask/add_user.dart';

class TMBottomSheet extends StatelessWidget {
  const TMBottomSheet({
    super.key,
    this.onPressed,
    this.controller,
    required this.users,
    this.onSearch,
  });

  final ScrollController? controller;
  final Function(AppUserModel)? onPressed;
  final List<AppUserModel> users;
  final Function(String)? onSearch;

  static Future<T?> show<T>(
    BuildContext context, {
    Function(AppUserModel)? onPressed,
    required List<AppUserModel> users,
    Function(String)? onSearch,
  }) {
    return showFlexibleBottomSheet(
      isModal: true,
      maxHeight: 0.7,
      minHeight: 0.5,
      bottomSheetBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ),
      context: context,
      builder: (context, controller, _) {
        return TMBottomSheet(
          onPressed: onPressed,
          onSearch: onSearch,
          controller: controller,
          users: users,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: AddUser(
        onPressed: onPressed,
        onSearch: onSearch,
        controller: controller,
        users: users,
      ),
    );
  }
}

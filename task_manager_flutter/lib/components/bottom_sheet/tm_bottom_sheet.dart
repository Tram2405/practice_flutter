import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/ui/manager/subtask/add_user.dart';

class TMBottomSheet extends StatelessWidget {
  const TMBottomSheet({super.key, this.onPressed, this.controller});
  final ScrollController? controller;
  final Function(AppUserModel)? onPressed;

  static Future<T?> show<T>(
    BuildContext context, {
    Function(AppUserModel)? onPressed,
  }) {
    return showFlexibleBottomSheet(
      isModal: true,
      maxHeight: 1,
      minHeight: 0.5,
      bottomSheetBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ),
      context: context,
      builder: (context, controller, _) {
        ///Create a stateful widget to update the bottom sheet appearance
        return TMBottomSheet(
          onPressed: onPressed,
          controller: controller,
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
        controller: controller,
      ),
    );
  }
}

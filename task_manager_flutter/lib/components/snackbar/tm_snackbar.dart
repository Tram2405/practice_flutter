import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMSnackBar {
  static void tmSnackBarSuccess(
    BuildContext context, {
    required String titleSnackbar,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 13.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: TMColor.primarySnackBarSuccess,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            titleSnackbar,
            style: context.textTheme.titleLarge
                ?.copyWith(color: TMColor.onSecondary),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 10.0),
      ),
    );
  }

  static void tmSnackBarError(
    BuildContext context, {
    required String titleSnackbar,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 13.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: TMColor.secondarySnackBarError,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            titleSnackbar,
            style: context.textTheme.titleLarge,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 10.0),
      ),
    );
  }
}

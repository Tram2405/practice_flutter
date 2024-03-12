import 'package:flutter/material.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class ChooseDateTime {
  static Future<String?> pickDateTime(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );

    if (date == null) {
      return null;
    } else {
      // ignore: use_build_context_synchronously
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time == null) {
        return null;
      } else {
        return date.copyWith(hour: time.hour,minute: time.minute).toString().toDateTime;
      }
    }
  }
}

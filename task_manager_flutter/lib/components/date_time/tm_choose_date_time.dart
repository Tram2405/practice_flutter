import 'package:flutter/material.dart';

class ChooseDateTime {
  //Displays a dialog to pick a date and time.
  static Future<String?> pickDateTime(BuildContext context,{required DateTime firstDate, required DateTime lastDate}) async {
    DateTime? date = await showDatePicker(
      //firstDate: The earliest date selectable.
      //lastDate: The latest date selectable.
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    //
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
        return date.copyWith(hour: time.hour,minute: time.minute).toString();
      }
    }
  }
}

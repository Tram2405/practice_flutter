import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_flutter/components/card/tm_display_info.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

extension ExString on String? {
  String get toDateTime {
    try {
      return DateFormat('d.M.yyyy - h:mm')
          .format(DateTime.parse(this ?? '').toLocal());
    } on FormatException {
      return '--:--';
    }
  }

  Widget toStatusDisplay(BuildContext context) {
    switch (this) {
      case 'low':
        return TMDisplayInfo(
          color: TMColor.completed,
          child: Text(
            'Low',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onCompleted,
            ),
          ),
        );
      case 'high':
        return TMDisplayInfo(
          color: TMColor.high,
          child: Text(
            'High',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onHigh,
            ),
          ),
        );
      case 'medium':
        return TMDisplayInfo(
          color: TMColor.progress,
          child: Text(
            'Medium',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onProgress,
            ),
          ),
        );
      default:
        return TMDisplayInfo(
          child: Text(this ?? ''),
        );
    }
  }
}

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

  Widget toStyleTaskDisplay(BuildContext context) {
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

  Widget toStatusSubTask(BuildContext context) {
    switch (this) {
      case 'newTask':
        return TMDisplayInfo(
          color: TMColor.onSecondary,
          child: Text(
            'New Task',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onBackground,
            ),
          ),
        );
      case 'inProgress':
        return TMDisplayInfo(
          color: TMColor.progress,
          child: Text(
            'In progress',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onProgress,
            ),
          ),
        );
      case 'error':
        return TMDisplayInfo(
          color: TMColor.error,
          child: Text(
            'Error',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onError,
            ),
          ),
        );
      case 'confirmation':
        return TMDisplayInfo(
          color: TMColor.confirm,
          child: Text(
            'Confirmation',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onConfirm,
            ),
          ),
        );
        case 'completed':
        return TMDisplayInfo(
          color: TMColor.completed,
          child: Text(
            'Completed',
            style: context.textTheme.bodySmall?.copyWith(
              color: TMColor.onCompleted,
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

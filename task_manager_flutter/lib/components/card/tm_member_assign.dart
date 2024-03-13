import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';

class TMMemberAssign extends StatelessWidget {
  const TMMemberAssign({
    super.key,
    required this.subTask,
    this.radius = 12.5,
    this.textStyle,
  });
  final SubTaskModel subTask;
  final double? radius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(
            subTask.user?.avatar ?? '',
          ),
        ),
        const SizedBox(width: 10.0),
        TMTitle(
          title: subTask.user?.name ?? '',
          textStyle: textStyle ?? context.textTheme.bodyMedium,
        )
      ],
    );
  }
}

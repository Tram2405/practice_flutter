import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';

class TMMemberAssign extends StatelessWidget {

  ///Create a card displaying the assigned member in the subtask
  ///
  ///The [subTask] arguments must not be null
  const TMMemberAssign({
    required this.subTask,
    this.radius = 12.5,
    this.textStyle,
    super.key,
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
            subTask.user?.avatar ?? Assets.images.imgAvatarDefault.path,
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

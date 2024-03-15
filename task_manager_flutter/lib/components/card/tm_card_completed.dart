import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_avatar_member.dart';
import 'package:task_manager_flutter/components/card/tm_display_info.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class TMCardCompleted extends StatelessWidget {
  const TMCardCompleted({
    super.key,
    required this.onPressed,
    required this.task,
  });

  final Function() onPressed;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: TMColor.onSecondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TMTitle(
              title: task.nameTask ?? '',
              textStyle: context.textTheme.labelLarge?.copyWith(
                color: TMColor.onTask,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(height: 12.0),
            TMTitle(
              title: task.description ?? '',
              textStyle: context.textTheme.bodyMedium
                  ?.copyWith(color: TMColor.primaryIcon),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                TMDisplayInfo(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.iconFlag,
                        width: 15.0,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        task.startDate.toDateTime,
                        style: context.textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                TMAvatarMember(
                  subtasks: task.subTasks,
                  minLength: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

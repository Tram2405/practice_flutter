import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_avatar_member.dart';
import 'package:task_manager_flutter/components/card/tm_display_info.dart';
import 'package:task_manager_flutter/components/card/tm_percent_task.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class TMCardTask extends StatelessWidget {
  const TMCardTask({super.key, required this.task, required this.onPressed});
  final TaskModel task;
  final Function() onPressed;

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
                const SizedBox(width: 10.0),
                task.typeTask.toStyleTaskDisplay(context),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              task.nameTask ?? '',
              style: context.textTheme.displayMedium
                  ?.copyWith(color: TMColor.onBackground),
            ),
            const SizedBox(height: 12.0),
            Text(task.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: TMColor.primaryIcon)),
            const SizedBox(height: 16.0),
            TMPercentTask(
              percent: task.getPercentCompleted(),
            ),
            const Divider(
              color: TMColor.button,
              thickness: 1.0,
            ),
            Row(
              children: [
                TMAvatarMember(
                  subtasks: task.subTasks ?? [],
                  minLength: 4,
                ),
                const Spacer(),
                TMDisplayInfo(
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.icons.iconPaperclip),
                      const SizedBox(width: 10.0),
                      Text(
                        '${task.numberFile ?? 0}',
                        style: context.textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 12.0),
                TMDisplayInfo(
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.icons.iconComment),
                      const SizedBox(width: 10.0),
                      Text(
                        '${task.numberComment ?? 0}',
                        style: context.textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_display_info.dart';
import 'package:task_manager_flutter/components/menu_button/tm_menu_button.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class TMCardSubTask extends StatelessWidget {
  TMCardSubTask({
    super.key,
    this.onTap,
    required this.subTask,
    this.onDelete,
    Color? color,
  }) : color = color ?? TMColor.secondaryContainer.withOpacity(0.6);

  final Function()? onTap;
  final SubTaskModel subTask;
  final Function()? onDelete;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
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
                    subTask.startDate.toDateTime ?? '',
                    style: context.textTheme.bodySmall,
                  )
                ],
              )),
                const Spacer(),
                if (onDelete != null)
                  TMPopupMenuSubtask(
                    onSelected: (value) {},
                  ),
              ],
            ),
            const SizedBox(height: 8.0),
            subTask.status.toStatusDisplay(context),
            const SizedBox(height: 8.0),
            TMTitle(
              title: subTask.subTaskName ?? '',
              textStyle: context.textTheme.displayMedium,
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                CircleAvatar(
                  radius: 12.5,
                  backgroundImage: AssetImage(
                    subTask.user?.avatar ?? '',
                  ),
                ),
                const SizedBox(width: 10.0),
                TMTitle(
                  title: subTask.user?.name ?? '',
                  textStyle: context.textTheme.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_display_info.dart';
import 'package:task_manager_flutter/components/card/tm_member_assign.dart';
import 'package:task_manager_flutter/components/menu_button/tm_popup_menu.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class TMCardSubTask extends StatelessWidget {
  TMCardSubTask({
    super.key,
    this.onTap,
    this.onSelected,
    required this.subTask,
    Color? color,
    this.index,
  }) : color = color ?? TMColor.secondaryContainer.withOpacity(0.4);

  final Function()? onTap;
  final Function(int)? onSelected;
  final SubTaskModel subTask;
  final Color? color;
  final int? index;

  @override
  Widget build(BuildContext context) {
    const sizedBox8 = SizedBox(height: 8.0);
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
                        subTask.startDate.toDateTime,
                        style: context.textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                if (onSelected != null)
                  TMPopupMenuSubtask(
                    onSelected: onSelected,
                  ),
              ],
            ),
            sizedBox8,
            subTask.status.toStatusSubTask(context),
            sizedBox8,
            TMTitle(
              title: subTask.subTaskName ?? '',
              textStyle: context.textTheme.displayMedium
                  ?.copyWith(color: TMColor.onBackground),
            ),
            const SizedBox(height: 10.0),
            TMMemberAssign(subTask: subTask),
          ],
        ),
      ),
    );
  }
}

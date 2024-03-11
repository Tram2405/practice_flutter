import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_button_task.dart';
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
                TMButtonTask(
                  text: subTask.startDate ?? '',
                  leftIcon: Assets.icons.iconFlag,
                  color: TMColor.background,
                ),
                const Spacer(),
                if (onDelete != null)
                  TMPopupMenuSubtask(
                    onSelected: (value) {
                      if (value == 0) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         DetailSubTaskPage(subTask: widget.subTask),
                        //   ),
                        // );
                      } else if (value == 1) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => EditSubTaskPage(
                        //       subTask: widget.subTask,
                        //       onDone: () {
                        //         setState(() {});
                        //       },
                        //     ),
                        //   ),
                        // );
                      } else {
                        // TMDialog.dialog(
                        //   context,
                        //   title: 'Delete SubTask?',
                        //   content: 'Are you sure you want to delete SubTask',
                        //   action: widget.onDelete,
                        // );
                      }
                    },
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

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_display_info.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class TMCardCompletedSubTask extends StatelessWidget {
  const TMCardCompletedSubTask({
    super.key,
    this.onPressed,
    required this.subTask,
  });

  final Function()? onPressed;
  final SubTaskModel subTask;
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
                Text(
                  subTask.subTaskName ?? '',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: TMColor.onTask,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            Text(
              subTask.description ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
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
                        subTask.startDate.toDateTime,
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

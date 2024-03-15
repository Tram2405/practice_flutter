import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_card_member_subtask.dart';
import 'package:task_manager_flutter/components/card/tm_display_info.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class TMCardApproval extends StatelessWidget {
  const TMCardApproval({
    super.key,
    required this.onPressed,
    required this.task,
    required this.user,
  });

  final Function() onPressed;
  final TaskModel task;
  final AppUserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const SizedBox(width: 14.0),
              task.typeTask.toStyleTaskDisplay(context),
            ],
          ),
          const SizedBox(height: 10.0),
          TMCardMemberSubTask(
            user: user,
          ),
          const SizedBox(height: 10.0),
          TMTitle(
            title: task.nameTask ?? '',
            textStyle: context.textTheme.displayMedium
                ?.copyWith(color: TMColor.onTask),
          ),
          const SizedBox(height: 12.0),
          TMTitle(
            title: task.description ?? '',
            textStyle: context.textTheme.bodySmall
                ?.copyWith(color: TMColor.primaryIcon),
          ),
        ],
      ),
    );
  }
}

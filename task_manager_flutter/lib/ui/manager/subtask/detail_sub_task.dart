import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_bottom_button.dart';
import 'package:task_manager_flutter/components/card/tm_member_assign.dart';
import 'package:task_manager_flutter/components/date_time/tm_display_date_time.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/manager/subtask/detail_subtask_controller.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/enum.dart';
import 'package:task_manager_flutter/utils/extension.dart';

enum DetailSubTaskType { no, action }

class DetailSubTaskPage extends GetView<DetailSubTaskController> {
  const DetailSubTaskPage({super.key, this.detailType = DetailSubTaskType.no});
  final DetailSubTaskType detailType;

  @override
  Widget build(BuildContext context) {
    const sizedBox12 = SizedBox(height: 12.0);
    final subTask = Get.arguments[0] as SubTaskModel;
    return TMScaffold(
      backgroundColor: TMColor.background,
      appBar: TMAppbar(
        title: AppLocalizations.of(context).txtDetailSubTask,
        leftIcon: Assets.icons.iconArrowLeft,
        leftPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subTask.status.toStatusSubTask(context),
            const SizedBox(height: 8.0),
            TMTitle(
              title: subTask.subTaskName ?? '',
              textStyle: context.textTheme.displaySmall,
            ),
            sizedBox12,
            Row(
              children: [
                TMDisplayDateTime(
                  title: AppLocalizations.of(context).txtStartDate,
                  dateTime: subTask.startDate.toDateTime,
                ),
                const SizedBox(width: 30.0),
                TMDisplayDateTime(
                  title: AppLocalizations.of(context).txtDueDate,
                  textColor: TMColor.onError,
                  dateTime: subTask.dueDate.toDateTime,
                ),
              ],
            ),
            sizedBox12,
            TMTitle(
              title: subTask.description ?? '',
              isReadMore: true,
              textStyle: context.textTheme.titleLarge
                  ?.copyWith(color: TMColor.onBackground),
            ),
            const SizedBox(height: 16.0),
            TMTitle(
              title: AppLocalizations.of(context).txtExecutor,
              textStyle: context.textTheme.displaySmall,
            ),
            sizedBox12,
            TMMemberAssign(
              subTask: subTask,
              radius: 20,
              textStyle: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: detailType == DetailSubTaskType.action &&
              subTask.status != StatusType.completed.name
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TMBottomButton(
                  isAction: subTask.status != StatusType.confirmation.name,
                  onPressed: () {
                    controller.action(subTask);
                  },
                  text: controller.getTextButton(context, subTask.status ?? ''),
                ),
              ],
            )
          : null,
    );
  }
}

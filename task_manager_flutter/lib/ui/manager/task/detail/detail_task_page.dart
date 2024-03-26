import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_button_task.dart';
import 'package:task_manager_flutter/components/card/tm_card_subtask.dart';
import 'package:task_manager_flutter/components/card/tm_percent_task.dart';
import 'package:task_manager_flutter/components/date_time/tm_display_date_time.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_text_prompt.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/manager/task/detail/detail_task_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/extension.dart';

enum DetailType { no, edit }

class DetailTaskPage extends StatelessWidget {
  const DetailTaskPage({super.key, this.detailType = DetailType.no});
  final DetailType detailType;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      DetailTaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
    const sizedBox12 = SizedBox(height: 12.0);
    const sizedBox16 = SizedBox(height: 16.0);

    return Obx(
      () => TMScaffold(
        backgroundColor: TMColor.onSecondary,
        appBar: TMAppbar(
          title: AppLocalizations.of(context).txtDetailTask,
          leftIcon: Assets.icons.iconArrowLeft,
          leftPressed: () => Get.back(result: controller.task.value),
          rightIcon: Assets.icons.iconComment,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.task.value.typeTask.toStyleTaskDisplay(context),
              sizedBox12,
              TMTitle(
                title: controller.task.value.nameTask ?? '--:--',
                textStyle: context.textTheme.displaySmall,
                isReadMore: true,
              ),
              sizedBox12,
              TMDisplayDateTime(
                title: AppLocalizations.of(context).txtStartDate,
                dateTime: controller.task.value.startDate.toDateTime,
              ),
              sizedBox12,
              TMTitle(
                title: controller.task.value.description ?? '',
                textStyle: context.textTheme.bodyMedium,
                isReadMore: true,
              ),
              sizedBox12,
              TMTitle(
                title: AppLocalizations.of(context).txtProgress,
                textStyle: context.textTheme.labelLarge,
              ),
              sizedBox16,
              TMPercentTask(
                percent: controller.task.value.getPercentCompleted(),
              ),
              sizedBox16,
              TMTitle(
                title: AppLocalizations.of(context).txtSubTasks,
                textStyle: context.textTheme.labelLarge,
              ),
              if (detailType == DetailType.edit) ...[
                sizedBox12,
                TMButtonTask(
                  onPressed: () {
                    Get.toNamed(Routes.ADD_SUB_TASK)?.then((value) {
                      controller.addSubTask(context, value);
                    });
                  },
                  text: AppLocalizations.of(context).txtAddSubTask,
                  leftIcon: Assets.icons.iconAdd,
                  leftIconColor: TMColor.background,
                ),
              ],
              sizedBox16,
              controller.task.value.subTasks.isNotEmpty
                  ? ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.task.value.subTasks.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final subTask = controller.task.value.subTasks[index];
                        return TMCardSubTask(
                          onTap: controller.emailUser != null &&
                                  controller.emailUser == subTask.user?.email
                              ? () {
                                  Get.toNamed(
                                    controller.emailUser == null
                                        ? Routes.DETAIL_SUB_TASK
                                        : Routes.DETAIL_SUB_TASK_MEMBER,
                                    arguments: [subTask],
                                  )?.then((value) {
                                    controller.task.refresh();
                                  });
                                }
                              : detailType == DetailType.edit
                                  ? () {
                                      Get.toNamed(
                                        Routes.DETAIL_SUB_TASK,
                                        arguments: [subTask],
                                      )?.then((value) {
                                        controller.task.refresh();
                                      });
                                    }
                                  : null,
                          onSelected: detailType == DetailType.edit
                              ? (value) {
                                  controller.onSelectDropDown(
                                      context, value, subTask, index);
                                }
                              : null,
                          subTask: subTask,
                          index: index,
                          color: controller.emailUser != null &&
                                  controller.emailUser == subTask.user?.email
                              ? TMColor.primaryContainer
                              : null,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                    )
                  : TMTextPrompt(
                      text: AppLocalizations.of(context).txtNoSubTask)
            ],
          ),
        ),
      ),
    );
  }
}

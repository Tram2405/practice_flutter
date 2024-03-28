import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_bottom_button.dart';
import 'package:task_manager_flutter/components/card/tm_card_message.dart';
import 'package:task_manager_flutter/components/card/tm_member_assign.dart';
import 'package:task_manager_flutter/components/date_time/tm_display_date_time.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_text_prompt.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/manager/subtask/detail_subtask_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/generated/l10n.dart';
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

    return Obx(
      () => TMScaffold(
        backgroundColor: TMColor.background,
        appBar: TMAppbar(
          title: S.of(context).txtDetailSubTask,
          leftIcon: Assets.icons.iconArrowLeft,
          leftPressed: () => Get.back(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.subTask.value.status.toStatusSubTask(context),
              const SizedBox(height: 8.0),
              TMTitle(
                title: controller.subTask.value.subTaskName ?? '',
                textStyle: context.textTheme.displaySmall,
              ),
              sizedBox12,
              Row(
                children: [
                  TMDisplayDateTime(
                    title: S.of(context).txtStartDate,
                    dateTime: controller.subTask.value.startDate.toDateTime,
                  ),
                  const SizedBox(width: 30.0),
                  TMDisplayDateTime(
                    title: S.of(context).txtDueDate,
                    textColor: TMColor.onError,
                    dateTime: controller.subTask.value.dueDate.toDateTime,
                  ),
                ],
              ),
              sizedBox12,
              TMTitle(
                title: controller.subTask.value.description ?? '',
                isReadMore: true,
                textStyle: context.textTheme.titleLarge
                    ?.copyWith(color: TMColor.onBackground),
              ),
              const SizedBox(height: 16.0),
              TMTitle(
                title: S.of(context).txtExecutor,
                textStyle: context.textTheme.displaySmall,
              ),
              sizedBox12,
              TMMemberAssign(
                subTask: controller.subTask.value,
                radius: 20,
                textStyle: context.textTheme.titleMedium,
              ),
              sizedBox12,
              TMTitle(
                title: 'Message',
                textStyle: context.textTheme.displaySmall,
              ),
              sizedBox12,
              controller.subTask.value.messages.isEmpty
                  ? TMTextPrompt(
                      text: S.of(context).txtNoMessage,
                    )
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.subTask.value.messages.length,
                      itemBuilder: (context, index) {
                        final message =
                            controller.subTask.value.messages[index];
                        return TMCardMessage(message: message);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10.0),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: detailType == DetailSubTaskType.action &&
                controller.subTask.value.status != StatusType.completed.name
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TMBottomButton(
                    isAction: controller.subTask.value.status !=
                        StatusType.confirmation.name,
                    onPressed: () {
                      controller.action();
                    },
                    text: controller.getTextButton(
                      controller.subTask.value.status ?? '',
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}

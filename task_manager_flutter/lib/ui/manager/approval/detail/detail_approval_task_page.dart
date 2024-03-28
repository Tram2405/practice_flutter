import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/card/tm_card_message.dart';
import 'package:task_manager_flutter/components/date_time/tm_display_date_time.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_form_field.dart';
import 'package:task_manager_flutter/controller/manager/approval/detail/detail_approval_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/generated/l10n.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/enum.dart';
import 'package:task_manager_flutter/utils/extension.dart';

enum TaskType { no, action }

class DetailApprovalTaskPage extends GetView<DetailApprovalController> {
  const DetailApprovalTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox12 = SizedBox(height: 12.0);
    return Obx(
      () => TMScaffold(
        backgroundColor: TMColor.onSecondary,
        appBar: TMAppbar(
          title: controller.subTask.value.user?.name ?? '',
          leftIcon: Assets.icons.iconClose,
          leftPressed: () => Get.back(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.subTask.value.status.toStatusSubTask(context),
              sizedBox12,
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
                textStyle: context.textTheme.bodyMedium
                    ?.copyWith(color: TMColor.primaryIcon),
                isReadMore: true,
              ),
              const SizedBox(height: 15.0),
              TMTextField(
                hintText: S.of(context).txtDescription,
                textInputAction: TextInputAction.done,
                controller: controller.descriptionController,
                onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 20.0),
              TMTitle(
                title: 'Message',
                textStyle: context.textTheme.displaySmall,
              ),
              sizedBox12,
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.subTask.value.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.subTask.value.messages[index];
                  return TMCardMessage(message: message);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10.0),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TMElevateButton(
                onPressed:
                    controller.canAction.value ? controller.addMessage : null,
                text: S.of(context).btnSendAgain,
                color: controller.canAction.value
                    ? TMColor.primary
                    : TMColor.button,
                borderRadius: BorderRadius.circular(10.0),
                textColor: controller.canAction.value
                    ? TMColor.onBackground
                    : TMColor.onPrimary,
              ),
              const Spacer(),
              TMElevateButton(
                onPressed: () {
                  controller.subTask.value.status = StatusType.completed.name;
                  Get.back();
                },
                text: S.of(context).btnApproval,
                color: TMColor.primaryOnBoarding,
                textColor: TMColor.onSecondary,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

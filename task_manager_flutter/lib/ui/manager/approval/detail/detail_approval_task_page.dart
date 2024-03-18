import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/date_time/tm_display_date_time.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_form_field.dart';
import 'package:task_manager_flutter/controller/manager/approval/detail/detail_approval_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/enum.dart';
import 'package:task_manager_flutter/utils/extension.dart';
enum TaskType{no, action}
class DetailApprovalTaskPage extends GetView<DetailApprovalController> {
  const DetailApprovalTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox12 = SizedBox(height: 12.0);
    return TMScaffold(
      appBar: TMAppbar(
        title: controller.subTask.user?.name ?? '',
        leftIcon: Assets.icons.iconClose,
        leftPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.subTask.status.toStatusSubTask(context),
            sizedBox12,
            TMTitle(
              title: controller.subTask.subTaskName ?? '',
              textStyle: context.textTheme.displaySmall,
            ),
            sizedBox12,
            Row(
              children: [
                TMDisplayDateTime(
                  title: 'Start Date',
                  dateTime: controller.subTask.startDate.toDateTime,
                ),
                const SizedBox(width: 30.0),
                TMDisplayDateTime(
                  title: 'Due Date',
                  textColor: TMColor.onError,
                  dateTime: controller.subTask.dueDate.toDateTime,
                ),
              ],
            ),
            sizedBox12,
            TMTitle(
              title: controller.subTask.description ?? '',
              textStyle: context.textTheme.bodyMedium
                  ?.copyWith(color: TMColor.primaryIcon),
              isReadMore: true,
            ),
            const SizedBox(height: 20.0),
            TMTextField(
              hintText: 'Descripton',
              maxLines: 4,
              textInputAction: TextInputAction.done,
              controller: controller.descriptionController,
              // onChanged: (_) => controller.checkIsEmpty(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TMElevateButton(
              onPressed: () {
                controller.subTask.status = StatusType.error.name;
                Get.back();
              },
              text: 'Send again',
              color: TMColor.button,
              borderRadius: BorderRadius.circular(10.0),
            ),
            const SizedBox(height: 16.0),
            TMElevateButton(
              onPressed: () {
                controller.subTask.status = StatusType.completed.name;
                Get.back();
              },
              text: 'Approval',
              color: TMColor.primaryOnBoarding,
              textColor: TMColor.onSecondary,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ],
        ),
      ),
    );
  }
}

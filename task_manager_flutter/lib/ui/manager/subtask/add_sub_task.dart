import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/bottom_sheet/tm_bottom_sheet.dart';
import 'package:task_manager_flutter/components/buttons/tm_bottom_button.dart';
import 'package:task_manager_flutter/components/buttons/tm_button_task.dart';
import 'package:task_manager_flutter/components/card/tm_card_member_subtask.dart';
import 'package:task_manager_flutter/components/date_time/tm_date_time.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_form_field.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_sub_task_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class AddSubTaskPage extends GetView<AddSubTaskController> {
  const AddSubTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TMScaffold(
        backgroundColor: TMColor.onSecondary,
        appBar: TMAppbar(
          title: AppLocalizations.of(context).txtCreateSubtask,
          leftIcon: Assets.icons.iconClose,
          leftPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TMTitle(
                title: AppLocalizations.of(context).txtChooseDate,
                textStyle: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: 10.0),
              TMDateTime(
                onPressed: () {
                  controller.chooseStartDate(context);
                },
                text: AppLocalizations.of(context).txtStartDate,
                dateTime: controller.startDate.value.toDateTime,
              ),
              const SizedBox(height: 12.0),
              TMDateTime(
                onPressed: () {
                  controller.chooseDueDate(context);
                },
                text: AppLocalizations.of(context).txtDueDate,
                dateTime: controller.dueDate.value.toDateTime,
              ),
              const SizedBox(height: 25.0),
              TMTitle(
                title: AppLocalizations.of(context).txtAssignedUser,
                textStyle: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: 15.0),
              controller.userSelect.value == null
                  ? TMButtonTask(
                      onPressed: () {
                        TMBottomSheet.show(
                          context,
                          users: controller.listSearch,
                          onSearch: controller.searchUser,
                          onPressed: controller.assignUser,
                        );
                      },
                      text: AppLocalizations.of(context).btnAdd,
                      leftIcon: Assets.icons.iconAdd2,
                    )
                  : TMCardMemberSubTask(
                      user: controller.userSelect.value!,
                      onRemove: () => controller.onDeleteUser(),
                    ),
              const SizedBox(height: 15.0),
              TMTextField(
                hintText: AppLocalizations.of(context).txtSubTaskName,
                textInputAction: TextInputAction.next,
                controller: controller.subTaskNameController,
                onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 26.0),
              TMTextField(
                hintText: AppLocalizations.of(context).txtDescription,
                maxLines: 4,
                textInputAction: TextInputAction.done,
                controller: controller.descriptionController,
                onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
        bottomNavigationBar: TMBottomButton(
          text: AppLocalizations.of(context).txtAddSubTask,
          onPressed: controller.addSubTask,
          isAction: controller.canAction.value,
        ),
      ),
    );
  }
}

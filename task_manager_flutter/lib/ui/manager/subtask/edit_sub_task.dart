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
import 'package:task_manager_flutter/controller/manager/subtask/add_user_controller.dart';
import 'package:task_manager_flutter/controller/manager/subtask/edit_subtask_controller.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/provider/user_provider.dart';
import 'package:task_manager_flutter/data/respository/user_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class EditSubTaskPage extends GetView<EditSubTaskController> {
  const EditSubTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox12 = SizedBox(height: 12.0);
    final subTask = Get.arguments[0] as SubTaskModel;
    controller.getSubTask(subTask);

    final controllerS = Get.put(
      AddUserController(
        userRepository: UserRepository(
          userProvider: UserProvider(),
        ),
      ),
    );
    return Obx(
      () => TMScaffold(
        appBar: TMAppbar(
          title: 'Edit Sub Task',
          leftIcon: Assets.icons.iconClose,
          leftPressed: () => Get.back(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TMTitle(
                title: 'Chose date',
                textStyle: context.textTheme.displaySmall,
              ),
              sizedBox12,
              TMDateTime(
                onPressed: () {
                  controller.chooseStartDate(context);
                },
                text: 'Start Date',
                dateTime: (controller.startDate.value ?? subTask.startDate)
                    .toDateTime,
              ),
              sizedBox12,
              TMDateTime(
                onPressed: () {
                  controller.chooseDueDate(context);
                },
                text: 'Due Date',
                dateTime:
                    (controller.dueDate.value ?? subTask.dueDate).toDateTime,
              ),
              sizedBox12,
              TMTitle(
                title: 'Assigned users',
                textStyle: context.textTheme.displaySmall,
              ),
              const SizedBox(height: 6.0),
              controller.userSelect.value == null
                  ? TMButtonTask(
                      onPressed: () {
                        TMBottomSheet.show(
                          context,
                          onPressed: (user) {
                            controller.assignUser(user);
                          },
                        ).whenComplete(() {
                          // controller.descriptionController
                          controllerS.searchUser();
                        });
                      },
                      text: 'Add',
                      leftIcon: Assets.icons.iconAdd2,
                    )
                  : TMCardMemberSubTask(
                      user: controller.userSelect.value!,
                      onRemove: () => controller.onDeleteUser(),
                    ),
              const SizedBox(height: 18.0),
              TMTextField(
                hintText: 'SubTask Name',
                textInputAction: TextInputAction.next,
                controller: controller.subTaskNameController,
                onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 26.0),
              TMTextField(
                hintText: 'Descripton',
                maxLines: 4,
                textInputAction: TextInputAction.done,
                controller: controller.descriptionController,
                onChanged: (_) => controller.checkIsEmpty(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: TMBottomButton(
          text: 'Edit Sub Task',
          onPressed: () => controller.updateSubTask(context),
          isAction: controller.canAction.value,
        ),
      ),
    );
  }
}

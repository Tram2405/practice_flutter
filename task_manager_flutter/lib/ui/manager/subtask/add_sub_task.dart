import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_bottom_button.dart';
import 'package:task_manager_flutter/components/buttons/tm_button_task.dart';
import 'package:task_manager_flutter/components/card/tm_card_member_subtask.dart';
import 'package:task_manager_flutter/components/date_time/tm_date_time_subtask.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_form_field.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_sub_task_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/ui/manager/subtask/add_user.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class AddSubTaskPage extends GetView<AddSubTaskController> {
  const AddSubTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TMScaffold(
        appBar: TMAppbar(
          title: 'Create Sub Task',
          leftIcon: Assets.icons.iconClose,
          leftPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TMTitle(
                  title: 'Chose date',
                  textStyle: context.textTheme.bodyLarge,
                ),
                const SizedBox(height: 10.0),
                TMDateTime(
                  onPressed: () {
                    controller.chooseStartDate(context);
                  },
                  text: 'Start Date',
                  dateTime: controller.startDate.value.toDateTime 
                ),
                const SizedBox(height: 12.0),
                TMDateTime(
                  onPressed: () {
                    controller.chooseDueDate(context);
                  },
                  text: 'Due Date',
                  dateTime: controller.dueDate.value.toDateTime,
                ),
                const SizedBox(height: 25.0),
                TMTitle(
                  title: 'Assigned users',
                  textStyle: context.textTheme.bodyLarge,
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    controller.userSelect.value == null
                        ? TMButtonTask(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, process) {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: AddUser(
                                          onPressed: (userSelected) {
                                            controller.assignUser(userSelected);
                                            process(() {});
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            text: 'Add',
                            leftIcon: Assets.icons.iconAdd2,
                          )
                        : TMCardMemberSubTask(
                            user: controller.userSelect!.value!,
                            onRemove: () => controller.onDeleteUser(),
                          ),
                  ],
                ),
                const SizedBox(height: 15.0),
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
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: TMBottomButton(
          text: 'Add Sub Task',
          onPressed: controller.addSubTask,
          isAction: controller.canAction.value,
        ),
      ),
    );
  }
}

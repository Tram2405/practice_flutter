import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_bottom_button.dart';
import 'package:task_manager_flutter/components/buttons/tm_button_task.dart';
import 'package:task_manager_flutter/components/card/tm_card_subtask.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_form_field.dart';
import 'package:task_manager_flutter/controller/manager/add_task_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class AddTaskPage extends GetView<AddTaskController> {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TMScaffold(
        appBar: TMAppbar(
          title: 'Create New Task',
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
                title: 'Task type',
                textStyle: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: 14.0),
              Obx(
                () => Row(
                  children: List.generate(controller.taskTypes.length, (index) {
                    final type = controller.taskTypes[index].name;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25.0),
                        onTap: () => controller.onSelectedType(index),
                        child: Container(
                          decoration: BoxDecoration(
                              border: controller.currentIndex.value == index
                                  ? Border.all(
                                      width: 1.5,
                                      color:
                                          TMColor.primaryIcon.withOpacity(0.6),
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(25.0)),
                          child: type.toStyleTaskDisplay(context),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20.0),
              TMTextField(
                hintText: 'Task name',
                textInputAction: TextInputAction.next,
                controller: controller.taskNameController,
                onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 15.0),
              TMTextField(
                hintText: 'Descripton',
                maxLines: 4,
                textInputAction: TextInputAction.done,
                controller: controller.descriptionController,
                onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 20.0),
              TMButtonTask(
                onPressed: () {
                  Get.toNamed(Routes.ADD_SUB_TASK)?.then((value) {
                    controller.addSubTask(value);
                  });
                },
                text: 'Add SubTask',
                leftIcon: Assets.icons.iconAdd,
                leftIconColor: TMColor.background,
              ),
              const SizedBox(height: 8.0),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.subTaskAdds.length,
                itemBuilder: (_, index) {
                  final subTask = controller.subTaskAdds[index];
                  return TMCardSubTask(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_SUB_TASK, arguments: [subTask]);
                    },
                    subTask: subTask,
                    onSelected: (value) {
                      if (value == 0) {
                        Get.toNamed(Routes.DETAIL_SUB_TASK,
                            arguments: [subTask]);
                      } else if (value == 1) {
                        Get.toNamed(Routes.EDIT_SUB_TASK, arguments: [subTask])
                            ?.then((value) {
                          if (value != null) {
                            controller.subTaskAdds[index] = value;
                          }
                          return null;
                        });
                      } else {
                        controller.subTaskAdds.remove(subTask);
                        controller.checkIsEmpty();
                      }
                    },
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 8.0),
              )
            ],
          ),
        ),
        bottomNavigationBar: TMBottomButton(
          text: 'Add Task',
          onPressed: controller.addTask,
          isAction: controller.canAction.value,
        ),
      ),
    );
  }
}

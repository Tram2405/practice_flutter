import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_bottom_button.dart';
import 'package:task_manager_flutter/components/buttons/tm_button_task.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_form_field.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_sub_task_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/ui/manager/subtask/add_user.dart';

class AddSubTaskPage extends GetView<AddSubTaskController> {
  const AddSubTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TMScaffold(
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
              const SizedBox(height: 25.0),
              TMTitle(
                title: 'Assigned users',
                textStyle: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  TMButtonTask(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, process) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: AddUser(
                                  onPressed: () {
                                    process(() {});
                                  },
                                  // onDone: (value) {
                                  //   userSelected = value;
                                  //   setState(() {});
                                  // },
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    text: 'Add',
                    leftIcon: Assets.icons.iconAdd2,
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              TMTextField(
                hintText: 'SubTask Name',
                textInputAction: TextInputAction.next,
                controller: controller.subTaskNameController,
                // onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 26.0),
              TMTextField(
                hintText: 'Descripton',
                maxLines: 4,
                textInputAction: TextInputAction.next,
                controller: controller.descriptionController,
                // onChanged: (_) => controller.checkIsEmpty(),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Add Task',
        onPressed: () {},
        // isAction: controller.canAction.value,
      ),
    );
  }
}

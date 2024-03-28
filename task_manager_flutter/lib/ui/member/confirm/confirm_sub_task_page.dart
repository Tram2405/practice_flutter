import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_bottom_button.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_form_field.dart';
import 'package:task_manager_flutter/controller/member/confirm/confirm_subtask_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/generated/l10n.dart'; 
import 'package:task_manager_flutter/resources/tm_color.dart';

class ConfirmSubTaskPage extends GetView<ConfirmSubTaskController> {
  const ConfirmSubTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TMScaffold(
      backgroundColor: TMColor.onSecondary,
      appBar: TMAppbar(
        title: S.of(context).txtConfirmTask,
        leftIcon: Assets.icons.iconBack,
        leftPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TMTextField(
          controller: controller.descriptionController,
          hintText: S.of(context).txhintDescription,
          maxLines: 4,
          onChanged: (_) => controller.checkIsEmpty(),
          textInputAction: TextInputAction.done,
        ),
      ),
      bottomNavigationBar: Obx(
        () => TMBottomButton(
          text: S.of(context).btnDone,
          onPressed: controller.onDone,
          isAction: controller.canAction.value,
        ),
      ),
    );
  }
}

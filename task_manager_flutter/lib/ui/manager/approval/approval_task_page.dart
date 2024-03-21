import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/text/tm_text_prompt.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/ui/manager/approval/widget/tm_list_confirm.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/controller/manager/approval/approval_task_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class ApprovalTaskPage extends StatelessWidget {
  const ApprovalTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ApprovalTaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
    return Obx(
      () => TMScaffold(
        backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
        appBar: TMAppbar(
          title: AppLocalizations.of(context).txtApproval,
          leftIcon: Assets.icons.iconAdd,
          rightIcon: Assets.icons.iconBell,
        ),
        body: controller.taskConfirms.isEmpty
            ? TMTextPrompt(text: AppLocalizations.of(context).txtNoSubTask)
            : ListView.separated(
                itemCount: controller.taskConfirms.length,
                itemBuilder: (_, index) {
                  final task = controller.taskConfirms[index];
                  return TMListConfirm(
                    task: task,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 3.0,
                ),
              ),
      ),
    );
  }
}

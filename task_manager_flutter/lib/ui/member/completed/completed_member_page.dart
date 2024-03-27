import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_text_prompt.dart';
import 'package:task_manager_flutter/controller/member/completed/completed_member_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/ui/member/completed/widget/tm_card_completed.dart';

class CompletedMemberPage extends StatelessWidget {
  const CompletedMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      CompletedMemberController(
        taskMemberRepository: TaskMemberRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
    return StreamBuilder<QuerySnapshot>(
        stream: controller.taskStream(),
        builder: (context, snapshot) {
          controller.getSubTaskConfirm(snapshot);
          return TMScaffold(
            backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
            appBar: TMAppbar(
              title: AppLocalizations.of(context).txtCompletedTask,
              rightIcon: Assets.icons.iconBell,
            ),
            body: controller.subTaskCompleted.isEmpty
                ? TMTextPrompt(
                    text: AppLocalizations.of(context).txtNoCompleted)
                : ListView.separated(
                    itemCount: controller.subTaskCompleted.length,
                    itemBuilder: (context, index) {
                      final subTask = controller.subTaskCompleted[index];
                      return TMCardCompletedSubTask(
                          onPressed: () {
                            Get.toNamed(
                              Routes.DETAIL_SUB_TASK_MEMBER,
                              arguments: [subTask],
                            );
                          },
                          subTask: subTask);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10.0,
                    ),
                  ),
          );
        });
  }
}

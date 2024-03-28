import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/text/tm_text_prompt.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/generated/l10n.dart';
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
    return StreamBuilder<QuerySnapshot>(
        stream: controller.taskStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return  TMTitle(title: S.of(context).txtSnackbarError);
          }

          if (snapshot.connectionState == (ConnectionState.waiting)) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<FirebaseCollectionData> documents = snapshot.data?.docs
                  .map((e) => FirebaseCollectionData()
                    ..id = e.id
                    ..task =
                        TaskModel.fromJson(e.data() as Map<String, dynamic>))
                  .toList() ??
              [];

          controller.getTask(documents);
          return TMScaffold(
            backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
            appBar: TMAppbar(
              title: S.of(context).txtApproval,
              leftIcon: Assets.icons.iconAdd,
              rightIcon: Assets.icons.iconBell,
            ),
            body: controller.taskConfirms.isEmpty
                ? TMTextPrompt(text: S.of(context).txtNoSubTask)
                : ListView.separated(
                    itemCount: controller.taskConfirms.length,
                    itemBuilder: (_, index) {
                      final task = controller.taskConfirms[index];
                      return TMListConfirm(
                        task: task,
                        id: documents[index].id ?? '',
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 5.0,
                    ),
                  ),
          );
        });
  }
}

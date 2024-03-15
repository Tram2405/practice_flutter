import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_card_approval.dart';
import 'package:task_manager_flutter/controller/manager/approval_task_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';

class TMListConfirm extends StatelessWidget {
  const TMListConfirm({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApprovalTaskController());
    controller.getSubTaskConfirm(task);
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.subTaskConfirms.length,
      itemBuilder: (_, index) {
        final subTask = controller.subTaskConfirms[index];
         return TMCardApproval(
            onPressed: () {},
            task: task,
            user: subTask.user ?? AppUserModel(),
          );
      },
      separatorBuilder: (_, index) => const SizedBox(
        height: 3.0,
      ),
    );
  }
}

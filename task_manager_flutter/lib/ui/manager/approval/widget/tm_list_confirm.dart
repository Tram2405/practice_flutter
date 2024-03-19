import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/card/tm_card_approval.dart';
import 'package:task_manager_flutter/controller/manager/approval/approval_task_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class TMListConfirm extends StatelessWidget {
  const TMListConfirm({
    required this.task,
    super.key,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ApprovalTaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
    controller.getSubTaskConfirm(task);
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.subTaskConfirms.length,
        itemBuilder: (_, index) {
          final subTask = controller.subTaskConfirms[index];
          return TMCardApproval(
            onPressed: () {
              Get.toNamed(
                Routes.DETAIL_APPROVAL_TASK,
                arguments: [subTask],
              )?.then((value) {
                controller.taskConfirms.refresh();
              });
            },
            task: task,
            user: subTask.user ?? AppUserModel(),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(
          height: 3.0,
        ),
      ),
    );
  }
}

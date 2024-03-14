import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_button_task.dart';
import 'package:task_manager_flutter/components/card/tm_card_subtask.dart';
import 'package:task_manager_flutter/components/card/tm_percent_task.dart';
import 'package:task_manager_flutter/components/date_time/tm_display_date_time.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/manager/detail_task_controller.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/extension.dart';

class DetailTaskPage extends GetView<DetailTaskController> {
  const DetailTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final task = Get.arguments[0] as TaskModel;
    const sizedBox12 = SizedBox(height: 12.0);
    const sizedBox16 = SizedBox(height: 16.0);
    controller.getSubTask(task);

    return Obx(
      () =>  TMScaffold(
        backgroundColor: TMColor.onSecondary,
        appBar: TMAppbar(
          title: 'Detail Task',
          leftIcon: Assets.icons.iconArrowLeft,
          leftPressed: () => Get.back(),
          rightIcon: Assets.icons.iconComment,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.task.value.typeTask.toStyleTaskDisplay(context),
              sizedBox12,
              TMTitle(
                title: controller.task.value.nameTask ?? '--:--',
                textStyle: context.textTheme.displaySmall,
              ),
              sizedBox12,
              TMDisplayDateTime(
                  title: 'Start Date',
                  dateTime: controller.task.value.subTasks?[0].dueDate.toDateTime ?? '--:--'),
              sizedBox12,
              TMTitle(
                title: controller.task.value.description ?? '',
                textStyle: context.textTheme.bodyMedium,
              ),
              sizedBox12,
              TMTitle(
                title: 'Progress',
                textStyle: context.textTheme.labelLarge,
              ),
              sizedBox16,
              TMPercentTask(
                percent: task.getPercentCompleted(),
              ),
              sizedBox16,
              TMTitle(
                title: 'SubTasks',
                textStyle: context.textTheme.labelLarge,
              ),
              sizedBox12,
              TMButtonTask(
                onPressed: () {
                  Get.toNamed(Routes.ADD_SUB_TASK);
                },
                text: 'Add SubTask',
                leftIcon: Assets.icons.iconAdd,
                leftIconColor: TMColor.background,
              ),
              sizedBox16,
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.task.value.subTasks?.length ?? 0,
                itemBuilder: (context, index) {
                  final subTask = controller.task.value.subTasks?[index] ?? SubTaskModel();
                  return TMCardSubTask(onTap: () {
                    Get.toNamed(Routes.DETAIL_SUB_TASK, arguments: [subTask]);
                  }, subTask: subTask,index: index,);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 6.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

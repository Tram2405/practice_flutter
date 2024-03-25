import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/card/tm_card_task.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/controller/manager/task/task_controller.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TaskController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
    return Obx(
      () => TMScaffold(
        backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
        appBar: TMAppbar(
          leftIcon: Assets.icons.iconAdd,
          leftPressed: () {
            Get.toNamed(Routes.ADD_TASK)?.then((value) {
              controller.listTask.add(value);
            });
          },
          title: AppLocalizations.of(context).txtTask,
          rightIcon: Assets.icons.iconBell,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: controller.listTask.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Image.asset(Assets.images.imgTaskEmpty.path),
                      ),
                    )
                  : ListView.separated(
                      itemCount: controller.listTask.length,
                      itemBuilder: (_, index) {
                        final task =
                            controller.listTask.reversed.toList()[index];

                        return TMCardTask(
                          task: task,
                          onPressed: () => Get.toNamed(
                            Routes.DETAIL_TASK,
                            arguments: [task],
                          )?.then((_) {
                            controller.listTask.refresh();
                          }),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 10.0,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

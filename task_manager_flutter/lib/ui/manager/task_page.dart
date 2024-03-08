import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/card/tm_card_task.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/manager/task_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());
    controller.getTask();
    return Obx(
      () => TMScaffold(
        backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
        appBar: TMAppbar(
          leftIcon: Assets.icons.iconAdd,
          leftPressed: () {},
          title: 'Task',
          rightIcon: Assets.icons.iconBell,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TMTitle(
                title: 'My Tasks',
                textStyle: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              controller.listTask.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Image.asset(Assets.images.imgTaskEmpty.path),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemCount: controller.listTask.length,
                        itemBuilder: (_, index) {
                          final task =
                              controller.listTask.reversed.toList()[index];
                          return GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => DetailTaskMemberPage(
                            //           task: task,
                            //         ),
                            //       ));
                            // },
                            child: TMCardTask(task: task),
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
      ),
    );
  }
}

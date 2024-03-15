import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/card/tm_card_completed.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/controller/manager/completed_task_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class CompletedTaskPage extends StatelessWidget {
  const CompletedTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompletedTaskController());
    controller.getSubTaskConfirm();
    return TMScaffold(
      backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
      appBar: TMAppbar(
        title: 'Completed Tasks',
        rightIcon: Assets.icons.iconBell,
      ),
      body: GestureDetector(
        onTap: () {},
        child: ListView.separated(
          itemCount: controller.taskCompleteds.length,
          itemBuilder: (_, index) {
            final task = controller.taskCompleteds[index];
            return TMCardCompleted(onPressed: () {
              Get.toNamed(Routes.DETAIL_COMPLETED_TASK, arguments: [task]);
            }, task: task);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 3.0),
        ),
      ),
    );
  }
}

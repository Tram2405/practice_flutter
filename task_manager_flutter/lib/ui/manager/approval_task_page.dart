import 'package:flutter/material.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/list/tm_list_confirm.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class ApprovalTaskPage extends StatelessWidget {
  const ApprovalTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TMScaffold(
      backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
      appBar: TMAppbar(
        title: 'Approval Tasks',
        leftIcon: Assets.icons.iconAdd,
        rightIcon: Assets.icons.iconBell,
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          final task = tasks[index];
          return TMListConfirm(task: task);
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: 3.0,
        ),
      ),
    );
  }
}

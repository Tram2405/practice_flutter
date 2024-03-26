import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/card/tm_card_task.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/member/task/task_member_controller.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/data/provider/task_provider.dart';
import 'package:task_manager_flutter/data/respository/task_member_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';

class TaskMemberPage extends StatelessWidget {
  const TaskMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TaskMemberController(
        taskMemberRepository: TaskMemberRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
    return TMScaffold(
      backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
      appBar: TMAppbar(
        title: AppLocalizations.of(context).txtTask,
        rightIcon: Assets.icons.iconBell,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.taskStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const TMTitle(title: 'Something went wrong');
            }

            if (snapshot.connectionState == (ConnectionState.waiting)) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<DocumentData> documents = snapshot.data?.docs
                    .map((e) => DocumentData()
                      ..id = e.id
                      ..task =
                          TaskModel.fromJson(e.data() as Map<String, dynamic>))
                    .toList() ??
                [];

            controller.getMyTask(documents);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TMTitle(
                  title: AppLocalizations.of(context).txtMyTask,
                  textStyle: context.textTheme.bodyLarge,
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: controller.myTasks.isEmpty
                      ? Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Image.asset(Assets.images.imgTaskEmpty.path),
                          ),
                        )
                      : ListView.separated(
                          itemCount: controller.myTasks.length,
                          itemBuilder: (_, index) {
                            final task =
                                controller.myTasks.reversed.toList()[index];

                            return TMCardTask(
                              task: task,
                              onPressed: () => Get.toNamed(
                                Routes.DETAIL_TASK_MEMBER,
                                arguments: {
                                  'task': task,
                                  'email': controller.userCurrent?.email,
                                },
                              )?.then((_) {
                                controller.myTasks.refresh();
                              }),
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 10.0,
                          ),
                        ),
                ),
              ],
            );
          }),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/card/tm_card_task.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/manager/task/task_controller.dart';
import 'package:task_manager_flutter/data/model/document_data.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
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
    return TMScaffold(
      backgroundColor: TMColor.primaryIcon.withOpacity(0.1),
      appBar: TMAppbar(
        leftIcon: Assets.icons.iconAdd,
        leftPressed: () {
          Get.toNamed(Routes.ADD_TASK);
        },
        title: AppLocalizations.of(context).txtTask,
        rightIcon: Assets.icons.iconBell,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.taskStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return  TMTitle(title: AppLocalizations.of(context).txtSnackbarError);
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: documents.isEmpty
                      ? Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Image.asset(Assets.images.imgTaskEmpty.path),
                          ),
                        )
                      : ListView.separated(
                          itemCount: documents.length,
                          itemBuilder: (_, index) {
                            String? id =
                                documents[index].id;
                            final task =
                                documents[index].task ??
                                    TaskModel();

                            return TMCardTask(
                              task: task,
                              onPressed: () => Get.toNamed(
                                Routes.DETAIL_TASK,
                                arguments: {'task': task, 'id': id},
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
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/data/model/task_model.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/enum.dart';
import 'package:task_manager_flutter/utils/extension.dart';

typedef MyDataType = BuildContext;
typedef MyFunction = Function()?;

class TMDialog {
  TMDialog._();

  static void dialog(
    MyDataType context, {
    required title,
    required content,
    MyFunction action,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TMColor.onSecondary,
        surfaceTintColor: Colors.transparent,
        title: Center(
          child: Text(
            title,
            style: context.textTheme.displaySmall,
          ),
        ),
        content: Row(
          children: [
            Expanded(
              child: Text(
                content,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: TMColor.primaryIcon),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textDialog(
                context,
                title: AppLocalizations.of(context).btnYes,
                onPressed: () {
                  action?.call();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 40.0),
              textDialog(
                context,
                title: AppLocalizations.of(context).btnNo,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  static GestureDetector textDialog(BuildContext context,
      {required String title, required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: context.textTheme.labelLarge?.copyWith(color: TMColor.onPrimary),
      ),
    );
  }

  static void editingDialog(
    BuildContext context, {
    required String title,
    required String valueNameTask,
    required String valueDescriptionTask,
    required String nameTaskType,
    TextEditingController? nameTaskController,
    TextEditingController? descriptionController,
    Function(TaskModel)? action,
  }) {
    nameTaskController?.text = valueNameTask;
    descriptionController?.text = valueDescriptionTask;
    FocusNode editingNode = FocusNode();
    List<TaskType> taskTypes = [
      TaskType.low,
      TaskType.medium,
      TaskType.high,
    ];
    String typeSelected = nameTaskType;
    editingNode.requestFocus();
    bool canAction = false;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          void checkAction() {
            canAction = (nameTaskController?.text != valueNameTask ||
                descriptionController?.text != valueDescriptionTask ||
                typeSelected != nameTaskType);
          }

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: List.generate(taskTypes.length, (index) {
                      final type = taskTypes[index].name;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25.0),
                          onTap: () {
                            typeSelected = type;
                            checkAction();
                            setState(() {});
                          },
                          child: type.toStyleTaskDisplay(
                            context,
                            isFocus: type == typeSelected,
                          ),
                        ),
                      );
                    }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TMTextFormField(
                          controller: nameTaskController,
                          onChanged: (_) => setState(checkAction),
                          lableText: '',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TMTextFormField(
                          controller: descriptionController,
                          onChanged: (_) => setState(checkAction),
                          lableText: '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: canAction
                      ? () {
                          action?.call(
                            TaskModel()
                              ..nameTask = nameTaskController?.text
                              ..description = descriptionController?.text
                              ..typeTask = typeSelected,
                          );
                          Navigator.pop(context);
                        }
                      : null,
                  child: Text(
                    AppLocalizations.of(context).btnYes,
                    style: 
                        // color: canAction ? null : TMColor.onSecondaryBackground,
                        context.textTheme.labelMedium?.copyWith(color: canAction ? TMColor.onPrimary : TMColor.onSecondaryBackground)
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context).btnCancel,
                      style: context.textTheme.labelMedium?.copyWith(color: TMColor.onSecondaryBackground)),
                ),
              ],
            );
          });
        });
  }
}

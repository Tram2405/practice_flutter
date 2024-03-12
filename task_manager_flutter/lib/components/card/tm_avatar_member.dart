import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/subtask_model.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMAvatarMember extends StatelessWidget {
  const TMAvatarMember({
    super.key,
    required this.subtasks,
    required this.minLength,
  });
  final List<SubTaskModel> subtasks;
  final int minLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            (subtasks.length > minLength) ? minLength - 1 : subtasks.length,
            (index) {
          final avatar = subtasks[index].user?.avatar ?? '';
          return Align(
            widthFactor: 0.65,
            child: CircleAvatar(
              radius: 17.0,
              backgroundColor: TMColor.button,
              child: CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage(avatar),
              ),
            ),
          );
        }),
        //if members.length > minLength => hinden
        if (subtasks.length > minLength)
          Align(
            widthFactor: 0.65,
            child: CircleAvatar(
              radius: 17.0,
              backgroundColor: TMColor.textField,
              child: CircleAvatar(
                radius: 16.0,
                backgroundColor: TMColor.task,
                child: Text(
                  '+${subtasks.length - (minLength - 1)}',
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

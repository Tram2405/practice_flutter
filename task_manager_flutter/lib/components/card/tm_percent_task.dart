import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMPercentTask extends StatelessWidget {

  ///The bar displays the task's completion percentage
  ///
  ///[percent] arguments must not be null
  const TMPercentTask({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: TMColor.button,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: LinearProgressIndicator(
              value: percent / 100,
              color: TMColor.onPrimary,
              backgroundColor: TMColor.button,
              minHeight: 7.0,
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
        const SizedBox(width: 6.0),
        TMTitle(
          title: '${percent.toStringAsFixed(0)}%',
          textStyle: context.textTheme.labelLarge?.copyWith(fontSize: 13.0),
        ),
      ],
    );
  }
}

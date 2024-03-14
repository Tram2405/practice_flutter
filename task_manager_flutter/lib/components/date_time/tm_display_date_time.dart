import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMDisplayDateTime extends StatelessWidget {
  const TMDisplayDateTime({
    super.key,
    required this.title,
    required this.dateTime,
    this.icon,
    this.textColor = TMColor.onCompleted,
  });
  final String title;
  final String dateTime;
  final String? icon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(color: textColor),
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text(
              dateTime,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(width: 8.0),
            if (icon != null) SvgPicture.asset(icon!),
          ],
        ),
      ],
    );
  }
}

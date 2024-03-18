import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMDateTime extends StatelessWidget {
  ///Widget TMDateTime is used to display a date and time with an icon
  ///
  ///[text], [dateTime] arguments must not be null
  const TMDateTime({
    required this.text,
    required this.dateTime,
    this.onPressed,
    super.key,
  });
  final Function()? onPressed;
  final String text;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: TMColor.onPrimary,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SvgPicture.asset(Assets.icons.iconCalendar),
          ),
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 4.0),
            Text(
              dateTime,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

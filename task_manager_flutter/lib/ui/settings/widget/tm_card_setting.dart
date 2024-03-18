import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMCardSetting extends StatelessWidget {
  const TMCardSetting({
    required this.title,
    required this.onPressed,
    this.titleColor = TMColor.onButton,
    this.leftIcon,
    this.widget,
    super.key,
  });
  final Function() onPressed;
  final String? leftIcon;
  final String title;
  final Color? titleColor;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: TMColor.onSecondary,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              leftIcon ?? '',
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 12.0),
            TMTitle(
              title: title ?? '',
              textStyle:
                  context.textTheme.titleLarge?.copyWith(color: titleColor),
            ),
            const Spacer(),
            if (widget != null) widget!,
          ],
        ),
      ),
    );
  }
}

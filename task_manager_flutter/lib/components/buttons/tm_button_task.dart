import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMButtonTask extends StatelessWidget {
  const TMButtonTask({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    required this.text,
    this.leftIconColor,
    this.rightIconColor,
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)),
  });
  final String? leftIcon;
  final String? rightIcon;
  final Function()? onPressed;
  final String text;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final Color? color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: color ?? TMColor.onPrimary,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            if (leftIcon != null) ...[
              SvgPicture.asset(
                leftIcon!,
                color: leftIconColor,
                width: 15.0,
              ),
              const SizedBox(width: 10.0),
            ],
            Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(color: TMColor.background)
            ),
            if (rightIcon != null) ...[
              const SizedBox(width: 10.0),
              SvgPicture.asset(
                rightIcon!,
                color: rightIconColor,
                width: 15.0,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

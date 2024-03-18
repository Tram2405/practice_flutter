import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMButtonTask extends StatelessWidget {
  ///A button using in task
  const TMButtonTask({
    required this.text,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)),
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.leftIconColor,
    this.rightIconColor,
    this.color,
    super.key,
  });

  ///[leftIcon], [rightIcon] : icon
  final String? leftIcon;
  final String? rightIcon;

  ///[onPressed] : The callback function is called when the button is pressed.
  final Function()? onPressed;

  ///[text] : Text content of the button
  final String text;

  ///[leftIconColor], [rightIconColor] : Color of the icon
  final Color? leftIconColor;
  final Color? rightIconColor;

  ///[color] : The background color of the button,
  ///The default will be the color of tmcolor.onprimary
  final Color? color;

  ///[borderRadius] : The curvature of the angles of the button.
  /// default is borderadius.circular (25.0)
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
          mainAxisSize: MainAxisSize.min,
          children: [
            ///If there is an icon on the left, add it to the row
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
              style: context.textTheme.bodySmall
                  ?.copyWith(color: TMColor.background),
            ),

            ///If there is an icon on the right, add it to the row
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

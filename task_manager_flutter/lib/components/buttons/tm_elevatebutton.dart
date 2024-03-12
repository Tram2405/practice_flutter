import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMElevateButton extends StatelessWidget {
  const TMElevateButton({
    super.key,
    this.onPressed,
    this.color,
    required this.text,
    this.textColor,
    this.height,
    this.icon,
    this.alignment,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(100.0)),
    this.isDisable = false,
  });
  final Function()? onPressed;
  final Color? color;
  final String text;
  final Color? textColor;
  final double? height;
  final String? icon;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onPressed,
      child: Container(
        padding: padding,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: isDisable
            ? Center(
                child: SizedBox.square(
                    dimension: 19.0,
                    child: CircularProgressIndicator(
                      color: textColor ?? TMColor.secondary,
                      strokeWidth: 3.0,
                    )),
              )
            : Row(
                mainAxisAlignment: icon == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  if (icon != null) const SizedBox(width: 20.0),
                  Text(
                    text,
                    style: context.textTheme.titleMedium
                        ?.copyWith(color: textColor),
                  ),
                  if (icon != null) SvgPicture.asset(icon!),
                ],
              ),
      ),
    );
  }
}

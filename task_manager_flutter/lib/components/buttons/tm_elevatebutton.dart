import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMElevateButton extends StatelessWidget {
  /// Create an [ElevatedButton]
  ///
  /// [text] arguments must not be null.
  const TMElevateButton({
    required this.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(100.0)),
    this.isDisable = false,
    this.onPressed,
    this.color,
    this.textColor,
    this.height,
    this.icon,
    this.alignment,
    super.key,
  });

  ///[onPressed]: Callback function is called when the button is pressed
  final Function()? onPressed;

  ///[color] : The background color of the button
  final Color? color;

  ///[text] : The text content of the button
  final String text;

  ///[textColor] : color off text
  final Color? textColor;

  ///[height] : Button height
  final double? height;

  ///[icon] :
  final String? icon;

  ///[alignment] : Alignment of the content in the button
  final Alignment? alignment;

  ///[padding] : Padding for button content.
  ///Default: horizontal = 20, vertical 16
  final EdgeInsetsGeometry? padding;

  ///[borderRadius] : The curvature of the button corners
  ///default: circular 100
  final BorderRadius? borderRadius;

  ///[isDisable] : Determine if the button is disabled, default = false
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///The callback function is called when the button is pressed, otherwise disabled
      onTap: isDisable ? null : onPressed,
      child: Container(
        padding: padding,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),

        /// If the button is disabled => Show Indicator Loading
        child: isDisable
            ? Center(
                child: SizedBox.square(
                    dimension: 19.0,
                    child: CircularProgressIndicator(
                      color: textColor ?? TMColor.secondary,
                      strokeWidth: 3.0,
                    )),
              )

            ///If not disabled, display text and symbols of the button
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

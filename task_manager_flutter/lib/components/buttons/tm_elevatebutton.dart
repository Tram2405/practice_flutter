import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    this.fontSize = 16.0,
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
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
        onTap: onPressed,
        child: Container(
          padding: padding,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(color: color, borderRadius: borderRadius),
          child: Row(
            mainAxisAlignment: icon == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null) const SizedBox(width: 20.0),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (icon != null)
                SvgPicture.asset(icon!),
            ],
          ),
        ),
    );
  }
}

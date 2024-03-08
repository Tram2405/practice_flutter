import 'package:flutter/material.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMDisplayInfo extends StatelessWidget {
  const TMDisplayInfo({
    super.key,
    this.onPressed,
    this.color = TMColor.button,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)),
    required this.child,
  });
  final Function()? onPressed;
  final Color color;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}

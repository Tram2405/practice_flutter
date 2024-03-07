import 'package:flutter/material.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTitle extends StatelessWidget {
  const TMTitle({
    super.key,
    required this.title,
    this.fontSize = 32.0,
    this.fontWeight = FontWeight.w700,
    this.colorTitle = TMColor.onBackground,
  });
  final String title;
  final double? fontSize; 
  final FontWeight? fontWeight;
  final Color? colorTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: colorTitle,
      ),
    );
  }
}

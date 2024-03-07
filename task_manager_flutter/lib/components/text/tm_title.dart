import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMTitle extends StatelessWidget {
  const TMTitle({
    super.key,
    required this.title,
    this.textStyle,
  });
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle ?? context.textTheme.displayLarge,
    );
  }
}

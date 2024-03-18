import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTextLink extends StatelessWidget {
  const TMTextLink({
    required this.text,
    required this.linkText,
    required this.onPressed,
    super.key,
  });
  final String text;
  final String linkText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: text,
            style: context.textTheme.titleMedium,
            children: [
              TextSpan(
                text: linkText,
                style: context.textTheme.titleMedium?.copyWith(
                  color: TMColor.onPrimary,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = onPressed,
              ),
            ]),
      ),
    );
  }
}

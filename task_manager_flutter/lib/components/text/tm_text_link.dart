import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTextLink extends StatelessWidget {
  const TMTextLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onPressed,
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
            style: const TextStyle(
                color: TMColor.onBackground,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: linkText,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: TMColor.onPrimary,
                ),
                recognizer: TapGestureRecognizer()..onTap = onPressed,
              ),
            ]),
      ),
    );
  }
}

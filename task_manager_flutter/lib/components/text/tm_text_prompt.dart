import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMTextPrompt extends StatelessWidget {
  const TMTextPrompt({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Text(
          text,
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}

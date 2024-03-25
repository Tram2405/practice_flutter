import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTextField extends StatelessWidget {
  const TMTextField({
    required this.hintText,
    this.controller,
    this.maxLines,
    this.onChanged,
    this.textInputAction,
    super.key,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      style:
          context.textTheme.titleLarge?.copyWith(color: TMColor.onBackground),
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.all(16.0),
        filled: true,
        fillColor: TMColor.button,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: context.textTheme.titleLarge,
      ),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}

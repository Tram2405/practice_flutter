import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTextFormField extends StatelessWidget {
  const TMTextFormField({
    required this.hintText,
    required this.lableText,
    this.controller,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.obscureText = false,
    this.readOnly = false,
    this.hintStyle,
    super.key,
  });

  final String lableText;
  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool readOnly;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lableText,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          style: TextStyle(color: readOnly ? TMColor.textField : null),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: TMColor.textField,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: TMColor.textField,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: readOnly ? TMColor.textField : TMColor.onBackground,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: hintText,
            hintStyle: hintStyle ?? context.textTheme.titleLarge,
          ),
          textInputAction: textInputAction,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

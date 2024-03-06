import 'package:flutter/material.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTextFormField extends StatelessWidget {
  const TMTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.obscureText = false,
    this.readOnly = false,
    this.hintStyle = const TextStyle(
      color: TMColor.onSecondaryBackground,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    required this.lableText,
    this.icon,
    this.onTap,
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
  final Widget? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lableText,
          style: const TextStyle(
            color: TMColor.onBackground,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          style: TextStyle(
              color: readOnly
                  ? TMColor.textField
                  : null), //auto check validator mỗi khi người dùng gõ phím
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
            hintStyle: hintStyle,
            suffixIcon: icon != null
                ? GestureDetector(
                    onTap: onTap,
                    child: icon,
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(maxHeight: 20, minWidth: 52.0),
          ),
          textInputAction: textInputAction, //icon duới bàn phím
          onChanged: onChanged,
        ),
      ],
    );
  }
}

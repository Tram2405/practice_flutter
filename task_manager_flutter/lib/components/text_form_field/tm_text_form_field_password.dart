import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTextFormFieldPassword extends StatefulWidget {
  const TMTextFormFieldPassword({
    required this.lableText,
    required this.hintText,
    this.controller,
    this.validator,
    this.textInputAction,
    this.onChanged,
    this.readOnly = false,
    this.hintStyle,
    this.onTap,
    super.key,
  });

  final String lableText;
  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final TextStyle? hintStyle;
  final Function()? onTap;

  @override
  State<TMTextFormFieldPassword> createState() =>
      _TMTextFormFieldPasswordState();
}

class _TMTextFormFieldPasswordState extends State<TMTextFormFieldPassword> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lableText,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: isShowPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.readOnly,
          style: TextStyle(color: widget.readOnly ? TMColor.textField : null),
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
                color:
                    widget.readOnly ? TMColor.textField : TMColor.onBackground,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ?? context.textTheme.titleLarge,
            suffixIcon: GestureDetector(
              onTap: () {
                isShowPassword = !isShowPassword;
                setState(() {});
              },
              child: SvgPicture.asset(
                isShowPassword ? Assets.icons.iconEyeOff : Assets.icons.iconEye,
                color: TMColor.textField,
              ),
            ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 20, minWidth: 52.0),
          ),
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMAppbarSearch extends StatelessWidget implements PreferredSizeWidget {

  ///Widget TMAppbarSearch is a custom search bar
  const TMAppbarSearch({
    super.key,
    this.controller,
    this.hintText,
    this.leftIcon,
    this.colorLeftIcon,
    this.onChanged,
  });

  ///[controller] : Manage imported content
  final TextEditingController? controller;

  ///[hintText] : The suggested word is displayed in textformfield
  final String? hintText;

  final String? leftIcon;
  final Color? colorLeftIcon;

  ///[onChanged] The callback function is called when the content of textformfield changes
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: TMColor.onSecondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: TMColor.primaryShadow.withOpacity(0.1),
            offset: const Offset(0.0, 5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: context.textTheme.bodyMedium
              ?.copyWith(color: TMColor.primaryIcon),
          prefixIcon: leftIcon != null
              ? SvgPicture.asset(
                  leftIcon!,
                  color: colorLeftIcon,
                  width: 20.0,
                )
              : null,

          ///Constrain the size of the left icon.
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 24.0,
            minWidth: 56.0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}

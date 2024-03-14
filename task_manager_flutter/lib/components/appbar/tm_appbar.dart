import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppbar({
    super.key,
    this.leftPressed,
    this.rightPressed,
    this.leftIcon,
    this.rightIcon,
    this.colorLeftIcon,
    this.colorRightIcon,
    required this.title,
    this.colorText = TMColor.onTask,
  });

  final Function()? leftPressed;
  final Function()? rightPressed;
  final String? leftIcon;
  final String? rightIcon;
  final Color? colorLeftIcon;
  final Color? colorRightIcon;
  final String title;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(
          top: MediaQuery.of(context).padding.top + 16.0, bottom: 16.0),
      decoration: BoxDecoration(
        color: TMColor.onSecondary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: TMColor.primaryShadow.withOpacity(0.1),
            offset: const Offset(0.0, 5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftIcon != null
              ? GestureDetector(
                  onTap: leftPressed,
                  child: SvgPicture.asset(
                    leftIcon!,
                    color: colorLeftIcon,
                    width: 22.0,
                    height: 22.0,
                  ),
                )
              : const SizedBox(width: 24.0),
          Text(
            title,
            style: TextStyle(
              color: colorText,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          rightIcon != null
              ? GestureDetector(
                  onTap: rightPressed,
                  child: SvgPicture.asset(
                    rightIcon!,
                    color: colorRightIcon,
                    width: 22.0,
                    height: 22.0,
                  ),
                )
              : const SizedBox(width: 24.0),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

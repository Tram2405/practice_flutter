import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMAppbar extends StatelessWidget implements PreferredSizeWidget {
  ///custom widget representing the title bar in the application.
  const TMAppbar({
    required this.title,
    this.leftPressed,
    this.rightPressed,
    this.leftIcon,
    this.rightIcon,
    this.colorLeftIcon,
    this.colorRightIcon,
    super.key,
  });

  ///[leftPressed] : The callback function is called when the user clicks on the left icon
  final Function()? leftPressed;

  ///[rightPressed] : The callback function is called when the user clicks on the right icon
  final Function()? rightPressed;

  ///[leftIcon], [rightIcon] icon
  final String? leftIcon;
  final String? rightIcon;

  ///[colorLeftIcon], [colorRightIcon] color icon
  final Color? colorLeftIcon;
  final Color? colorRightIcon;

  ///[title] : Title of the title bar.
  final String title;

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
          ///Check if the icon on the left exists or not, if so,
          /// create a [GestureDetector] with the icon and [onTap] the event
          /// Otherwise, it returns a [SizedBox] widget to preserve the space
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
            style: context.textTheme.labelSmall,
          ),

          ///Check if the icon on the right exists or not, if so,
          /// create a [GestureDetector] with the icon and [onTap] the event
          /// Otherwise, it returns a [SizedBox] widget to preserve the space
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMButtomEditProfile extends StatelessWidget {
  /// Create an [Button] for setting page
  ///
  /// [title] arguments must not be null.
  const TMButtomEditProfile({
    this.onPressed,
    required this.title,
    this.mainAxisSize = MainAxisSize.max,
    super.key,
  });
  final Function()? onPressed;
  final String title;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          
          border: Border.all(
            color: TMColor.secondary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          children: [
            SvgPicture.asset(Assets.icons.iconEdit),
            const SizedBox(width: 8.0),
            Text(
              title,
              style: context.textTheme.titleMedium
                  ?.copyWith(color: TMColor.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

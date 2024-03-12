import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
    required this.user,
    this.onTap,
    this.onCheck,
  });

  final AppUserModel user;
  final Function()? onTap;
  final Function()? onCheck;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(color: TMColor.onSecondary),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(user.avatar ?? ''),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(user.name ?? ''),
            const Spacer(),
            GestureDetector(
              onTap: onCheck,
              child: SvgPicture.asset(
                (user.isCheck ?? false) == true
                    ? Assets.icons.iconRadioButtonCheck
                    : Assets.icons.iconRadioButton,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMCardMemberSubTask extends StatelessWidget {
  const TMCardMemberSubTask({super.key, required this.user, this.onRemove});
  final AppUserModel user;
  final Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: TMColor.button,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14.0,
            backgroundImage: AssetImage(user.avatar ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TMTitle(
                title: user.name ?? '',
                textStyle: context.textTheme.bodySmall,
                ),
          ),
          GestureDetector(
            onTap: onRemove,
            child: SvgPicture.asset(Assets.icons.iconCloseBlack),
          ),
        ],
      ),
    );
  }
}

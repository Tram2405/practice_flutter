import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_img_network.dart';

class TMCardMemberSubTask extends StatelessWidget {
  ///Create card user item for subtask
  ///
  ///The [onPressed], [task], [user] arguments must not be null
  const TMCardMemberSubTask({
    required this.user,
    this.onRemove,
    super.key,
  });

  final AppUserModel user;
  final Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: TMColor.button,
      ),
      child: InkWell(
        onTap: onRemove,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CircleAvatar(
                radius: 14.0,
                //set image when avatar null
                child: TMImageNetwork(imageUrl: user.avatar ?? ''),
              ),
            ),
            const SizedBox(width: 10.0),
            TMTitle(
              title: user.name ?? '',
              textStyle: context.textTheme.bodySmall,
            ),
            if (onRemove != null) ...[
              const SizedBox(width: 10.0),
              SvgPicture.asset(Assets.icons.iconCloseBlack)
            ],
          ],
        ),
      ),
    );
  }
}

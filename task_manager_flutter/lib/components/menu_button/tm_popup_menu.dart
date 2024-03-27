import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMPopupMenuSubtask extends StatelessWidget {
  const TMPopupMenuSubtask({
    this.onSelected,
    super.key,
  });

  final Function(int)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: TMColor.onSecondary,
      padding: EdgeInsets.zero,
      elevation: 0.8,
      icon: SvgPicture.asset(Assets.icons.iconMore),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      shadowColor: TMColor.secondaryOnBoarding,
      
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: textPopupMenu(context, AppLocalizations.of(context).btnDetail),
          ),
          PopupMenuItem(
            value: 1,
            child: textPopupMenu(context, AppLocalizations.of(context).btnEdit),
          ),
          PopupMenuItem(
            value: 2,
            child: textPopupMenu(context, AppLocalizations.of(context).btnDeleted),
          ),
        ];
      },
      onSelected: onSelected,
    );
  }

  Widget textPopupMenu(BuildContext context, String text) {
    return TMTitle(
      title: text,
      textStyle: context.textTheme.bodySmall,
    );
  }
}

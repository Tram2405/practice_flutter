import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMPopupMenuSubtask extends StatelessWidget {
  const TMPopupMenuSubtask({super.key, this.onSelected});

  final Function(int)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: TMColor.background,
      elevation: 0,
      padding: EdgeInsets.zero,
      icon: SvgPicture.asset('assets/svg/icon_more.svg'),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: textPopupMenu('Detail'),
          ),
          PopupMenuItem(
            value: 1,
            child: textPopupMenu('Edit'),
          ),
          PopupMenuItem(
            value: 2,
            child: textPopupMenu('Delete'),
          ),
        ];
      },
      onSelected: onSelected,
    );
  }

  Widget textPopupMenu(String text) {
    return TMTitle(
      title: text,
    );
  }
}

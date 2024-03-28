import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/model/message_model.dart';
import 'package:task_manager_flutter/gen/fonts.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_img_network.dart';

class TMCardMessage extends StatelessWidget {
  const TMCardMessage({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TMImageNetwork(
          imageUrl: message.avatar ?? '',
          demesion: 37.0,
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TMTitle(
                title: message.email ?? '',
                textStyle: context.textTheme.bodySmall?.copyWith(
                  fontFamily: FontFamily.interBold,
                  color: TMColor.onPrimary,
                ),
              ),
              TMTitle(
                title: message.message ?? '',
                textStyle: context.textTheme.bodyMedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/controller/member/completed/completed_member_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';

class CompletedMemberPage extends StatelessWidget {
  const CompletedMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompletedMemberController());
    return TMScaffold(
      appBar: TMAppbar(
        title: AppLocalizations.of(context).txtCompletedTask,
        rightIcon: Assets.icons.iconBell,
      ),

      ///TODO: create body
    );
  }
}

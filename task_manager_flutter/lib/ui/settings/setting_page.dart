import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/dialog/tm_dialog.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/settings/setting_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_buttom_edit_profile.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_card_profile.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_card_setting.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox24 = SizedBox(height: 24.0);
    return TMScaffold(
      backgroundColor: TMColor.onSecondary,
      appBar: TMAppbar(
        title: 'Settings',
        leftIcon: Assets.icons.iconBack,
        leftPressed: () => Get.back(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TMCardProfile(),
          const SizedBox(height: 32.0),
          TMButtomEditProfile(onPressed: () {}, title: 'Edit Profile'),
          sizedBox24,
          const Divider(color: TMColor.primaryDivider),
          sizedBox24,
          TMTitle(
            title: 'APP SETTING',
            textStyle: context.textTheme.bodySmall,
          ),
          TMCardSetting(
            onPressed: () {},
            title: 'Change Password',
            leftIcon: Assets.icons.iconLock,
          ),
          TMCardSetting(
            onPressed: () {},
            title: 'Notifications',
            leftIcon: Assets.icons.iconBell,
          ),
          TMCardSetting(
            title: 'Log out',
            titleColor: TMColor.onError,
            leftIcon: Assets.icons.iconLogout,
            onPressed: () {
              return TMDialog.dialog(
                context,
                title: 'LOGOUT?',
                content:
                    'Are you sure you want to log out from the application?',
                action: () => WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    AuthService().signOut();
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

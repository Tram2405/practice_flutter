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
import 'package:task_manager_flutter/ui/settings/widget/tm_card_notification.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_card_profile.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_card_setting.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox24 = SizedBox(height: 24.0);
    return TMScaffold(
      backgroundColor: TMColor.onSecondary,
      appBar: const TMAppbar(
        title: 'Settings',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TMCardProfile(),
          const SizedBox(height: 32.0),
          TMButtomEditProfile(
              onPressed: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
              title: 'Edit Profile'),
          sizedBox24,
          const Divider(color: TMColor.primaryDivider),
          sizedBox24,
          TMTitle(
            title: 'APP SETTING',
            textStyle: context.textTheme.bodySmall,
          ),
          TMCardSetting(
            onPressed: () {
              Get.toNamed(Routes.CHANGE_PASSWORD);
            },
            title: 'Change Password',
            leftIcon: Assets.icons.iconLock,
          ),
          TMCardSetting(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: TMColor.onSecondary,
                context: context,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Obx(
                        () => Column(
                          children: [
                            TMCardNoitfication(
                              title: 'Email Notifications',
                              onChanged: () {
                                controller.isEmailTurnOn.value =
                                    !controller.isEmailTurnOn.value;
                              },
                              isTurnOn: controller.isEmailTurnOn.value,
                            ),
                            TMCardNoitfication(
                              title: 'Push Notifications',
                              onChanged: () {
                                controller.isNotification.value =
                                    !controller.isNotification.value;
                              },
                              isTurnOn: controller.isNotification.value,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
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

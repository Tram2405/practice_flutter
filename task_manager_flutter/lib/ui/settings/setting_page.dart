import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/dialog/tm_dialog.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/settings/setting_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service_provider.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/generated/l10n.dart';
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
      appBar: TMAppbar(
        title: S.of(context).txtSetting,
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
            title: S.of(context).btnEditProfile,
          ),
          sizedBox24,
          const Divider(color: TMColor.primaryDivider),
          sizedBox24,
          TMTitle(
            title: S.of(context).txtAppSetting,
            textStyle: context.textTheme.bodySmall,
          ),
          TMCardSetting(
            onPressed: () {
              Get.toNamed(Routes.CHANGE_PASSWORD);
            },
            title: S.of(context).btnChangePass,
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
                              title: S.of(context)
                                  .btnEmailNotification,
                              onChanged: () {
                                controller.isEmailTurnOn.value =
                                    !controller.isEmailTurnOn.value;
                              },
                              isTurnOn: controller.isEmailTurnOn.value,
                            ),
                            TMCardNoitfication(
                              title:
                                  S.of(context).btnPushNotification,
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
            title: S.of(context).btnNotification,
            leftIcon: Assets.icons.iconBell,
          ),
          TMCardSetting(
            title: S.of(context).btnLogout,
            titleColor: TMColor.onError,
            leftIcon: Assets.icons.iconLogout,
            onPressed: () {
              return TMDialog.dialog(
                context,
                title: S.of(context).btnLogout,
                content: S.of(context).txtTitleLogout,
                action: () => WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    AuthServiceProvider().signOut();
                    Get.offAndToNamed(Routes.LOGIN);
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

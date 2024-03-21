import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_field_password.dart';
import 'package:task_manager_flutter/controller/settings/change_password_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: TMScaffold(
        appBar: TMAppbar(
          title: AppLocalizations.of(context).btnChangePass,
          leftIcon: Assets.icons.iconBack,
          leftPressed: () => Get.back(),
        ),
        body: ListView(
          children: [
            Text(
              AppLocalizations.of(context).txtTitleChangePass1,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: TMColor.primaryOnBoarding),
            ),
            const SizedBox(height: 16.0),
            TMTextFormFieldPassword(
              lableText: AppLocalizations.of(context).txtCurrentPass,
              hintText: AppLocalizations.of(context).txtHintPassword,
              controller: controller.currentPasswordContoller,
              onChanged: (_) => controller.checkIsEmpty(),
            ),
            const SizedBox(height: 24.0),
            const Divider(color: TMColor.primaryDivider),
            const SizedBox(height: 24.0),
            Text(
              AppLocalizations.of(context).txtTitleChangePass2,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: TMColor.primaryOnBoarding),
            ),
            const SizedBox(height: 16.0),
            TMTextFormFieldPassword(
              controller: controller.newPassController,
              lableText: AppLocalizations.of(context).txtNewPass,
              hintText: AppLocalizations.of(context).txtHintPassword,
              validator: FormValidator.validatorPassword,
              onChanged: (_) => controller.checkIsEmpty(),
            ),
            const SizedBox(height: 12.0),
            Text(
              AppLocalizations.of(context).txtTitleChangePass3,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: TMColor.textField),
            ),
            const SizedBox(height: 32.0),
            TMTextFormFieldPassword(
              controller: controller.retypePassController,
              lableText: AppLocalizations.of(context).txtRetypePassword,
              hintText: AppLocalizations.of(context).txtHintPassword,
              validator: (value) {
                return FormValidator.validatorConfirmPassword(
                    value, controller.newPassController.text);
              },
              onChanged: (_) => controller.checkIsEmpty(),
            ),
            const SizedBox(height: 140.0),
            Obx(
              () => TMElevateButton(
                text: AppLocalizations.of(context).txtSubmitPass,
                color: controller.canAction.value
                    ? TMColor.primaryOnBoarding
                    : TMColor.primary,
                textColor: controller.canAction.value
                    ? TMColor.onSecondary
                    : TMColor.onBackground,
                icon: Assets.icons.iconNextWhite,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100.0),
                ),
                onPressed: controller.canAction.value
                    ? () {
                        controller.changePassword(
                          context,
                          controller.currentPasswordContoller.text,
                          controller.newPassController.text,
                        );
                      }
                    : null,
                isDisable: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

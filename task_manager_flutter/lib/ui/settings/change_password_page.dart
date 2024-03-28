import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_field_password.dart';
import 'package:task_manager_flutter/controller/settings/change_password_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/generated/l10n.dart';
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
          title: S.of(context).btnChangePass,
          leftIcon: Assets.icons.iconBack,
          leftPressed: () => Get.back(),
        ),
        body: ListView(
          children: [
            Text(
              S.of(context).txtTitleChangePass1,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: TMColor.primaryOnBoarding),
            ),
            const SizedBox(height: 16.0),
            TMTextFormFieldPassword(
              lableText: S.of(context).txtCurrentPass,
              hintText: S.of(context).txtHintPassword,
              controller: controller.currentPasswordContoller,
              onChanged: (_) => controller.checkIsEmpty(),
            ),
            const SizedBox(height: 24.0),
            const Divider(color: TMColor.primaryDivider),
            const SizedBox(height: 24.0),
            Text(
              S.of(context).txtTitleChangePass2,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: TMColor.primaryOnBoarding),
            ),
            const SizedBox(height: 16.0),
            TMTextFormFieldPassword(
              controller: controller.newPassController,
              lableText: S.of(context).txtNewPass,
              hintText: S.of(context).txtHintPassword,
              validator: FormValidator.validatorPassword,
              onChanged: (_) => controller.checkIsEmpty(),
            ),
            const SizedBox(height: 12.0),
            Text(
              S.of(context).txtTitleChangePass3,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: TMColor.textField),
            ),
            const SizedBox(height: 32.0),
            TMTextFormFieldPassword(
              controller: controller.retypePassController,
              lableText: S.of(context).txtRetypePassword,
              hintText: S.of(context).txtHintPassword,
              validator: (value) {
                return FormValidator.validatorConfirmPassword(
                    value, controller.newPassController.text);
              },
              onChanged: (_) => controller.checkIsEmpty(),
            ),
            const SizedBox(height: 140.0),
            Obx(
              () => TMElevateButton(
                text: S.of(context).txtSubmitPass,
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

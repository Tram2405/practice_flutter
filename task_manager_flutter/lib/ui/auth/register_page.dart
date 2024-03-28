import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_text_link.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_field_password.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/auth/register_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox32 = SizedBox(height: 32.0);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: TMScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView(
            children: [
              TMTitle(title: AppLocalizations.of(context).txtRegister),
              const SizedBox(height: 16.0),
              TMTitle(
                title: AppLocalizations.of(context).txtTitleRegister,
                textStyle: context.textTheme.titleLarge
                    ?.copyWith(color: TMColor.onSecondaryBackground),
              ),
              sizedBox32,
              TMTextFormField(
                hintText: AppLocalizations.of(context).txtHintName,
                lableText: AppLocalizations.of(context).txtFullName,
                controller: controller.nameController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorRequired,
                readOnly: controller.isLoading.value,
              ),
              sizedBox32,
              TMTextFormField(
                hintText: AppLocalizations.of(context).txtHintEmail,
                lableText: AppLocalizations.of(context).txtEmail,
                controller: controller.emailController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorEmail,
                readOnly: controller.isLoading.value,
              ),
              sizedBox32,
              TMTextFormFieldPassword(
                lableText: AppLocalizations.of(context).txtPassword,
                hintText: AppLocalizations.of(context).txtHintPassword,
                controller: controller.passwordController,
                validator: FormValidator.validatorPassword,
                readOnly: controller.isLoading.value,
                textInputAction: TextInputAction.next,
                onChanged: (_) => controller.isEmpty(),
              ),
              sizedBox32,
              TMTextFormFieldPassword(
                lableText: AppLocalizations.of(context).txtRetypePassword,
                hintText: AppLocalizations.of(context).txtHintRetypePassword,
                controller: controller.retypePasswordController,
                textInputAction: TextInputAction.done,
                onChanged: (_) => controller.isEmpty(),
                validator: (value) {
                  return FormValidator.validatorConfirmPassword(
                    value,
                    controller.passwordController.value.text,
                  );
                },
                readOnly: controller.isLoading.value,
              ),
              const SizedBox(height: 40.0),
              Obx(
                () => TMElevateButton(
                  text: AppLocalizations.of(context).btnRegister,
                  icon: Assets.icons.iconNext,
                  color: controller.hasContent.value
                      ? TMColor.primary
                      : TMColor.button,
                  borderRadius: BorderRadius.circular(100.0),
                  isDisable: controller.isLoading.value,
                  onPressed: () {
                    controller.register(context);
                  },
                ),
              ),
              sizedBox32,
              TMTextLink(
                text: AppLocalizations.of(context).txtLableRegister,
                linkText: AppLocalizations.of(context).txtLoginHere,
                onPressed: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

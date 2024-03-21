import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/auth/forgot_password_controller.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: TMScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView(
            children: [
              TMTitle(title: AppLocalizations.of(context).txtForgotPass),
              const SizedBox(height: 16.0),
              TMTitle(
                title: AppLocalizations.of(context).txtTitleForgotPass,
                textStyle: context.textTheme.titleLarge
                    ?.copyWith(color: TMColor.onSecondaryBackground),
              ),
              const SizedBox(height: 32.0),
              TMTextFormField(
                hintText: AppLocalizations.of(context).txtHintPassword,
                lableText: AppLocalizations.of(context).txtPassword,
                controller: controller.emailController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorEmail,
              ),
              const SizedBox(height: 64.0),
              Obx(
                () => TMElevateButton(
                  text: AppLocalizations.of(context).btnSendCode,
                  color: controller.hasContent.value
                      ? TMColor.primary
                      : TMColor.button,
                  onPressed: () {
                    controller.passwordReset(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

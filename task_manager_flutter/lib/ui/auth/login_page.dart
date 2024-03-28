import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_text_link.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_field_password.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/auth/login_controller.dart';
import 'package:task_manager_flutter/generated/l10n.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

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
              TMTitle(title: S.of(context).txtLetsLogin),
              const SizedBox(height: 16.0),
              TMTitle(
                title: S.of(context).txtTitleLogin,
                textStyle: context.textTheme.titleLarge
                    ?.copyWith(color: TMColor.onSecondaryBackground),
              ),
              sizedBox32,
              TMTextFormField(
                hintText: S.of(context).txtHintEmail,
                lableText: S.of(context).txtEmail,
                controller: controller.emailController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorEmail,
              ),
              sizedBox32,
              TMTextFormFieldPassword(
                lableText: S.of(context).txtPassword,
                hintText: S.of(context).txtHintPassword,
                controller: controller.passwordController,
                validator: FormValidator.validatorPassword,
                readOnly: controller.isLoading.value,
                onChanged: (_) => controller.isEmpty(),
              ),
              const SizedBox(height: 12.0),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.FORGOT_PASSWORD);
                },
                child: Text(
                  S.of(context).txtForgotPassword,
                  style: context.textTheme.titleMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: TMColor.onError,
                    color: TMColor.onError,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Obx(
                () => TMElevateButton(
                  onPressed: () async {
                    controller.login(context);
                  },
                  isDisable: controller.isLoading.value,
                  text: S.of(context).btnLogin,
                  color: controller.hasContent.value
                      ? TMColor.primary
                      : TMColor.button,
                ),
              ),
              sizedBox32,
              TMTextLink(
                text: S.of(context).txtLableLogin,
                linkText: S.of(context).txtRegisterHere,
                onPressed: () => Get.toNamed(Routes.REGISTER),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/auth/forgot_password_controller.dart';
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
              const TMTitle(title: 'Forgot Password'),
              const SizedBox(height: 16.0),
              const TMTitle(
                title:
                    'Insert your email address to receive a code for creating a new password',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                colorTitle: TMColor.onSecondaryBackground,
              ),
              const SizedBox(height: 32.0),
              TMTextFormField(
                hintText: 'Example: johndoe@gmail.com',
                lableText: 'Email Address',
                controller: controller.emailController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorEmail,
              ),
              const SizedBox(height: 64.0),
              Obx(
                () => TMElevateButton(
                  text: 'Send Code',
                  color: controller.hasContent.value
                      ? TMColor.primary
                      : TMColor.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

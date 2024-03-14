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
              const TMTitle(title: 'Register'),
              const SizedBox(height: 16.0),
              TMTitle(
                title: 'And start taking notes',
                textStyle: context.textTheme.titleLarge
                    ?.copyWith(color: TMColor.onSecondaryBackground),
              ),
              sizedBox32,
              TMTextFormField(
                hintText: 'Example: John Doe',
                lableText: 'Full Name',
                controller: controller.nameController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorRequired,
              ),
              sizedBox32,
              TMTextFormField(
                hintText: 'Example: johndoe@gmail.com',
                lableText: 'Email Address',
                controller: controller.emailController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorEmail,
              ),
              sizedBox32,
              TMTextFormFieldPassword(
                lableText: 'Password',
                hintText: '********',
                controller: controller.passwordController,
                validator: FormValidator.validatorPassword,
                readOnly: controller.isLoading.value,
              ),
              sizedBox32,
              TMTextFormFieldPassword(
                lableText: 'Retype Password',
                hintText: '********',
                controller: controller.retypePasswordController,
                validator: (value) {
                  return FormValidator.validatorConfirmPassword(
                    value,
                    controller.retypePasswordController.value.text,
                  );
                },
                readOnly: controller.isLoading.value,
              ),
              const SizedBox(height: 40.0),
              Obx(
                () => TMElevateButton(
                  text: 'Register',
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
                text: 'Already have an account? ',
                linkText: 'Login here',
                onPressed: () async {
                  Get.toNamed(Routes.LOGIN);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

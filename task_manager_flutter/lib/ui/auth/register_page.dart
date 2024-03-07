import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_text_link.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: TMScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView(
            children: [
              const TMTitle(title: 'Register'),
              const SizedBox(height: 16.0),
              const TMTitle(
                title: 'And start taking notes',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                colorTitle: TMColor.onSecondaryBackground,
              ),
              const SizedBox(height: 32.0),
              TMTextFormField(
                hintText: 'Example: John Doe',
                lableText: 'Full Name',
                controller: controller.nameController,
                onChanged: (_) => controller.isEmpty(),
                textInputAction: TextInputAction.next,
                validator: FormValidator.validatorRequired,
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
              const SizedBox(height: 32.0),
              Obx(
                () => TMTextFormField(
                  hintText: '********',
                  lableText: 'Password',
                  controller: controller.passwordController,
                  textInputAction: TextInputAction.next,
                  onChanged: (_) => controller.isEmpty(),
                  validator: FormValidator.validatorPassword,
                  obscureText: !controller.isShowPassword.value,
                  onTap: controller.changeStatePassword,
                  icon: SvgPicture.asset(
                    controller.isShowPassword.value
                        ? Assets.icons.iconEye
                        : Assets.icons.iconEyeOff,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Obx(
                () => TMTextFormField(
                  hintText: '********',
                  lableText: 'Retype Password',
                  controller: controller.retypePasswordController,
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => controller.isEmpty(),
                  validator: (value) {
                    return FormValidator.validatorConfirmPassword(
                      value,
                      controller.passwordController.text,
                    );
                  },
                  obscureText: !controller.isShowRetypePassword.value,
                  onTap: controller.changeStateRetypePassword,
                  icon: SvgPicture.asset(
                    controller.isShowRetypePassword.value
                        ? Assets.icons.iconEye
                        : Assets.icons.iconEyeOff,
                  ),
                ),
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
              const SizedBox(height: 32.0),
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

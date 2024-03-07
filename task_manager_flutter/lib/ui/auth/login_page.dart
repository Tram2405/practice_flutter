import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text/tm_text_link.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/auth/login_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
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
              const TMTitle(title: 'Let’s Login'),
              const SizedBox(height: 16.0),
              TMTitle(
                title: 'And notes your idea',
                textStyle: context.textTheme.titleLarge
                    ?.copyWith(color: TMColor.onSecondaryBackground),
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
              Obx(
                () => TMTextFormField(
                  hintText: '********',
                  lableText: 'Password',
                  controller: controller.passwordController,
                  onChanged: (_) => controller.isEmpty(),
                  textInputAction: TextInputAction.done,
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
              const SizedBox(height: 12.0),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.FORGOT_PASSWORD);
                },
                child: Text(
                  'Forgot Password',
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
                  text: 'Login',
                  color: controller.hasContent.value
                      ? TMColor.primary
                      : TMColor.button,
                ),
              ),
              sizedBox32,
              TMTextLink(
                text: 'Don’t have any account? ',
                linkText: 'Register here',
                onPressed: () => Get.toNamed(Routes.REGISTER),
              )
            ],
          ),
        ),
      ),
    );
  }
}

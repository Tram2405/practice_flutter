import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/text/tm_text_link.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/auth/login_controller.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const TMTitle(title: 'Let’s Login'),
                const SizedBox(height: 16.0),
                const TMTitle(
                  title: 'And notes your idea',
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
                const SizedBox(height: 32.0),
                Obx(
                  () => TMTextFormField(
                    hintText: '********',
                    lableText: 'Password',
                    controller: controller.passwordController,
                    onChanged: (_) => controller.isEmpty(),
                    textInputAction: TextInputAction.done,
                    validator: FormValidator.validatorPassword,
                    obscureText: controller.isShowPassword.value,
                    onTap: controller.changeStatePassword,
                    icon: Icon(
                      controller.isShowPassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                          color: TMColor.onSecondaryBackground,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.FORGOT_PASSWORD);
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: TMColor.onError,
                      color: TMColor.onError,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                Obx(
                  () => TMElevateButton(
                    onPressed: () async{
                      final message = await LoginController().login(
                  email: controller.emailController.text.trim(),
                  password: controller.passwordController.text.trim(),
                );
                if (message!.contains('Success')) {
                  Get.offAllNamed(Routes.HOME_MANAGER);
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                }
                    },
                    text: 'Login',
                    color: controller.hasContent.value
                        ? TMColor.primary
                        : TMColor.button,
                  ),
                ),
                const SizedBox(height: 32.0),
                TMTextLink(
                  text: 'Don’t have any account? ',
                  linkText: 'Register here',
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

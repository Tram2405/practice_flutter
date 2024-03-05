import 'package:get/get.dart';
import 'package:task_manager_flutter/bindings/auth/forgot_password_bind.dart';
import 'package:task_manager_flutter/bindings/auth/login_bind.dart';
import 'package:task_manager_flutter/bindings/auth/register_bind.dart';
import 'package:task_manager_flutter/ui/auth/forgot_password.dart';
import 'package:task_manager_flutter/ui/auth/login_page.dart';
import 'package:task_manager_flutter/ui/auth/register_page.dart';

part 'app_routes.dart';

class AppPage {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
     GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}

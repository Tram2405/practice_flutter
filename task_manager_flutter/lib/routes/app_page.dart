import 'package:get/get.dart';
import 'package:task_manager_flutter/bindings/auth/forgot_password_bind.dart';
import 'package:task_manager_flutter/bindings/auth/login_bind.dart';
import 'package:task_manager_flutter/bindings/auth/register_bind.dart';
import 'package:task_manager_flutter/bindings/manager/home_manager_bind.dart';
import 'package:task_manager_flutter/bindings/onboarding/onboarding_bind.dart';
import 'package:task_manager_flutter/bindings/splash/splash_bind.dart';
import 'package:task_manager_flutter/ui/auth/forgot_password.dart';
import 'package:task_manager_flutter/ui/auth/login_page.dart';
import 'package:task_manager_flutter/ui/auth/register_page.dart';
import 'package:task_manager_flutter/ui/manager/home_page_manager.dart';
import 'package:task_manager_flutter/ui/onboarding/onboarding_page.dart';
import 'package:task_manager_flutter/ui/splash/splash_page.dart';

part 'app_routes.dart';

class AppPage {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnBoardingPage(),
      binding: OnBoardingBinding(),
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
    GetPage(
      name: Routes.HOME_MANAGER,
      page: () => const HomePageManager(),
      binding: HomeManagerBinding(),
    ),
  ];
}

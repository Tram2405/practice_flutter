import 'package:get/get.dart';
import 'package:task_manager_flutter/bindings/auth/forgot_password_bind.dart';
import 'package:task_manager_flutter/bindings/auth/login_bind.dart';
import 'package:task_manager_flutter/bindings/auth/register_bind.dart';
import 'package:task_manager_flutter/bindings/manager/add_task_bind.dart';
import 'package:task_manager_flutter/bindings/manager/approval/detail/detail_approval_bind.dart';
import 'package:task_manager_flutter/bindings/manager/completed/detail/detail_completed_task_bind.dart';
import 'package:task_manager_flutter/bindings/manager/task/detail/detail_task_bind.dart';
import 'package:task_manager_flutter/bindings/manager/home_manager_bind.dart';
import 'package:task_manager_flutter/bindings/manager/subtask/add_sub_task_bind.dart';
import 'package:task_manager_flutter/bindings/manager/subtask/detail_subtask_bind.dart';
import 'package:task_manager_flutter/bindings/manager/subtask/edit_subtask_bind.dart';
import 'package:task_manager_flutter/bindings/manager/task/task_bind.dart';
import 'package:task_manager_flutter/bindings/onboarding/onboarding_bind.dart';
import 'package:task_manager_flutter/bindings/splash/splash_bind.dart';
import 'package:task_manager_flutter/ui/auth/forgot_password_page.dart';
import 'package:task_manager_flutter/ui/auth/login_page.dart';
import 'package:task_manager_flutter/ui/auth/register_page.dart';
import 'package:task_manager_flutter/ui/manager/add_task_page.dart';
import 'package:task_manager_flutter/ui/manager/approval/detail/detail_approval_task_page.dart';
import 'package:task_manager_flutter/ui/manager/task/detail/detail_task_page.dart';
import 'package:task_manager_flutter/ui/manager/home_page_manager.dart';
import 'package:task_manager_flutter/ui/manager/subtask/add_sub_task.dart';
import 'package:task_manager_flutter/ui/manager/subtask/detail_subtask.dart';
import 'package:task_manager_flutter/ui/manager/subtask/edit_sub_task.dart';
import 'package:task_manager_flutter/ui/manager/task/task_page.dart';
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
    GetPage(
      name: Routes.TASK_MANAGER,
      page: () => const TaskPage(),
      binding: TaskBindings(),
    ),
    GetPage(
      name: Routes.ADD_TASK,
      page: () => const AddTaskPage(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: Routes.ADD_SUB_TASK,
      page: () => const AddSubTaskPage(),
      binding: AddSubTaskBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_TASK,
      page: () => const DetailTaskPage(
        detailType: DetailType.edit,
      ),
      binding: DetaiTaskBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_SUB_TASK,
      page: () => const DetailSubTaskPage(),
      binding: DetailSubTaskBinding(),
    ),
    GetPage(
      name: Routes.EDIT_SUB_TASK,
      page: () => const EditSubTaskPage(),
      binding: EditSubTaskBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_APPROVAL_TASK,
      page: () => const DetailApprovalTaskPage(),
      binding: DetailApprovalTaskBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_COMPLETED_TASK,
      page: () => const DetailTaskPage(
        detailType: DetailType.no,
      ),
      binding: DetailCompletedTaskBinding(),
    ),
  ];
}

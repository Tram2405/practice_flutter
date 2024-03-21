// ignore_for_file: constant_identifier_names

part of './app_page.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const FORGOT_PASSWORD = '/forgot_password';
  static const HOME_MANAGER = '/home_manager';
  static const TASK_MANAGER = '/task_manager';
  static const ADD_TASK = '/add-task';
  static const ADD_SUB_TASK = '/add-sub-task';
  static const DETAIL_TASK = '/detail-task';
  static const DETAIL_SUB_TASK = '/detail-sub-task';
  static const EDIT_SUB_TASK = '/edit-sub-task';
  static const APPROVAL_TASK = '/approval-task';
  static const DETAIL_APPROVAL_TASK = '/detail-approval-task';
  static const COMPLETED_TASK = '/completed-task';
  static const DETAIL_COMPLETED_TASK = '/detail-completed-task';
  static const SETTING = '/setting';
  static const EDIT_PROFILE = '/edit-profile';
  static const CHANGE_PASSWORD = '/change-password';
  static const HOME_MEMBER = '/home_member';
  static const TASK_MEMBER = '/task-member';
  static const DETAIL_TASK_MEMBER = '/detail-task-member';
  static const DETAIL_SUB_TASK_MEMBER = '/detail-sub-task-member';
  static const COMPLETED_TASK_MEMBER = '/completed-task-member';
  static const CONFIRM_SUB_TASK_MEMBER = '/confirm-sub-task-member';
}

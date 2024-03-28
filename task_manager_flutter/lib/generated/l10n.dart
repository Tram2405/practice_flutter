// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Chào mừng bạn đến với Trình quản lý tác vụ. Tạo dự án, phân công nhiệm vụ và cộng tác dễ dàng.`
  String get txtOnboarding1 {
    return Intl.message(
      'Chào mừng bạn đến với Trình quản lý tác vụ. Tạo dự án, phân công nhiệm vụ và cộng tác dễ dàng.',
      name: 'txtOnboarding1',
      desc: '',
      args: [],
    );
  }

  /// `Quản lý nhiệm vụ chính. Phân loại, đặt ra thời hạn và nâng cao hiệu quả của nhóm.`
  String get txtOnboarding2 {
    return Intl.message(
      'Quản lý nhiệm vụ chính. Phân loại, đặt ra thời hạn và nâng cao hiệu quả của nhóm.',
      name: 'txtOnboarding2',
      desc: '',
      args: [],
    );
  }

  /// `Theo dõi tiến trình một cách dễ dàng. Giám sát nhiệm vụ và thúc đẩy nhóm của bạn lên tầm cao mới.`
  String get txtOnboarding3 {
    return Intl.message(
      'Theo dõi tiến trình một cách dễ dàng. Giám sát nhiệm vụ và thúc đẩy nhóm của bạn lên tầm cao mới.',
      name: 'txtOnboarding3',
      desc: '',
      args: [],
    );
  }

  /// `Trở về`
  String get txtBack {
    return Intl.message(
      'Trở về',
      name: 'txtBack',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp`
  String get txtNext {
    return Intl.message(
      'Tiếp',
      name: 'txtNext',
      desc: '',
      args: [],
    );
  }

  /// `Tạo tài khoản`
  String get txtRegister {
    return Intl.message(
      'Tạo tài khoản',
      name: 'txtRegister',
      desc: '',
      args: [],
    );
  }

  /// `Và bắt đầu ghi chép`
  String get txtTitleRegister {
    return Intl.message(
      'Và bắt đầu ghi chép',
      name: 'txtTitleRegister',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên`
  String get txtFullName {
    return Intl.message(
      'Họ và tên',
      name: 'txtFullName',
      desc: '',
      args: [],
    );
  }

  /// `Ví dụ: John Doe`
  String get txtHintName {
    return Intl.message(
      'Ví dụ: John Doe',
      name: 'txtHintName',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ email`
  String get txtEmail {
    return Intl.message(
      'Địa chỉ email',
      name: 'txtEmail',
      desc: '',
      args: [],
    );
  }

  /// `Ví dụ: johndoe@gmail.com`
  String get txtHintEmail {
    return Intl.message(
      'Ví dụ: johndoe@gmail.com',
      name: 'txtHintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get txtPassword {
    return Intl.message(
      'Mật khẩu',
      name: 'txtPassword',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get txtHintPassword {
    return Intl.message(
      '********',
      name: 'txtHintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu`
  String get txtRetypePassword {
    return Intl.message(
      'Nhập lại mật khẩu',
      name: 'txtRetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get txtHintRetypePassword {
    return Intl.message(
      '********',
      name: 'txtHintRetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã có tài khoản? `
  String get txtLableRegister {
    return Intl.message(
      'Bạn đã có tài khoản? ',
      name: 'txtLableRegister',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập tại đây`
  String get txtLoginHere {
    return Intl.message(
      'Đăng nhập tại đây',
      name: 'txtLoginHere',
      desc: '',
      args: [],
    );
  }

  /// `Hãy đăng nhập`
  String get txtLetsLogin {
    return Intl.message(
      'Hãy đăng nhập',
      name: 'txtLetsLogin',
      desc: '',
      args: [],
    );
  }

  /// `Và ghi lại ý tưởng của bạn`
  String get txtTitleLogin {
    return Intl.message(
      'Và ghi lại ý tưởng của bạn',
      name: 'txtTitleLogin',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu`
  String get txtForgotPassword {
    return Intl.message(
      'Quên mật khẩu',
      name: 'txtForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa có tài khoản? `
  String get txtLableLogin {
    return Intl.message(
      'Bạn chưa có tài khoản? ',
      name: 'txtLableLogin',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký ở đây`
  String get txtRegisterHere {
    return Intl.message(
      'Đăng ký ở đây',
      name: 'txtRegisterHere',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu`
  String get txtForgotPass {
    return Intl.message(
      'Quên mật khẩu',
      name: 'txtForgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Nhập địa chỉ email của bạn để nhận mã tạo mật khẩu mới`
  String get txtTitleForgotPass {
    return Intl.message(
      'Nhập địa chỉ email của bạn để nhận mã tạo mật khẩu mới',
      name: 'txtTitleForgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Nhiệm vụ`
  String get txtTask {
    return Intl.message(
      'Nhiệm vụ',
      name: 'txtTask',
      desc: '',
      args: [],
    );
  }

  /// `Nhiệm vụ của tôi`
  String get txtMyTask {
    return Intl.message(
      'Nhiệm vụ của tôi',
      name: 'txtMyTask',
      desc: '',
      args: [],
    );
  }

  /// `Tạo Nhiệm Vụ mới`
  String get txtCreateTask {
    return Intl.message(
      'Tạo Nhiệm Vụ mới',
      name: 'txtCreateTask',
      desc: '',
      args: [],
    );
  }

  /// `Loại nhiệm vụ`
  String get txtTaskType {
    return Intl.message(
      'Loại nhiệm vụ',
      name: 'txtTaskType',
      desc: '',
      args: [],
    );
  }

  /// `Tên nhiệm vụ`
  String get txtTaskName {
    return Intl.message(
      'Tên nhiệm vụ',
      name: 'txtTaskName',
      desc: '',
      args: [],
    );
  }

  /// `Mô tả`
  String get txtDescription {
    return Intl.message(
      'Mô tả',
      name: 'txtDescription',
      desc: '',
      args: [],
    );
  }

  /// `Thấp`
  String get txtLow {
    return Intl.message(
      'Thấp',
      name: 'txtLow',
      desc: '',
      args: [],
    );
  }

  /// `Trung bình`
  String get txtMedium {
    return Intl.message(
      'Trung bình',
      name: 'txtMedium',
      desc: '',
      args: [],
    );
  }

  /// `Cao`
  String get txtHigh {
    return Intl.message(
      'Cao',
      name: 'txtHigh',
      desc: '',
      args: [],
    );
  }

  /// `Thêm nhiệm vụ phụ`
  String get txtAddSubTask {
    return Intl.message(
      'Thêm nhiệm vụ phụ',
      name: 'txtAddSubTask',
      desc: '',
      args: [],
    );
  }

  /// `Không có nhiệm vụ phụ nào! `
  String get txtNoSubTask {
    return Intl.message(
      'Không có nhiệm vụ phụ nào! ',
      name: 'txtNoSubTask',
      desc: '',
      args: [],
    );
  }

  /// `Tạo nhiệm vụ phụ`
  String get txtCreateSubtask {
    return Intl.message(
      'Tạo nhiệm vụ phụ',
      name: 'txtCreateSubtask',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngày`
  String get txtChooseDate {
    return Intl.message(
      'Chọn ngày',
      name: 'txtChooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Ngày bắt đầu`
  String get txtStartDate {
    return Intl.message(
      'Ngày bắt đầu',
      name: 'txtStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Ngày kết thúc`
  String get txtDueDate {
    return Intl.message(
      'Ngày kết thúc',
      name: 'txtDueDate',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ định thành viên`
  String get txtAssignedUser {
    return Intl.message(
      'Chỉ định thành viên',
      name: 'txtAssignedUser',
      desc: '',
      args: [],
    );
  }

  /// `Tên nhiệm vụ phụ`
  String get txtSubTaskName {
    return Intl.message(
      'Tên nhiệm vụ phụ',
      name: 'txtSubTaskName',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm thành viên...`
  String get txtSearchMember {
    return Intl.message(
      'Tìm kiếm thành viên...',
      name: 'txtSearchMember',
      desc: '',
      args: [],
    );
  }

  /// `Phê duyệt`
  String get txtApproval {
    return Intl.message(
      'Phê duyệt',
      name: 'txtApproval',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get txtConfirmation {
    return Intl.message(
      'Xác nhận',
      name: 'txtConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Nhiệm vụ mới`
  String get txtNewTask {
    return Intl.message(
      'Nhiệm vụ mới',
      name: 'txtNewTask',
      desc: '',
      args: [],
    );
  }

  /// `Trong tiến trình`
  String get txtInProgress {
    return Intl.message(
      'Trong tiến trình',
      name: 'txtInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi`
  String get txtError {
    return Intl.message(
      'Lỗi',
      name: 'txtError',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get txtCompleted {
    return Intl.message(
      'Hoàn thành',
      name: 'txtCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Nhiệm vụ đã hoàn thành`
  String get txtCompletedTask {
    return Intl.message(
      'Nhiệm vụ đã hoàn thành',
      name: 'txtCompletedTask',
      desc: '',
      args: [],
    );
  }

  /// `Không có nhiệm vụ nào hoàn thành`
  String get txtNoCompleted {
    return Intl.message(
      'Không có nhiệm vụ nào hoàn thành',
      name: 'txtNoCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Tiến triển`
  String get txtProgress {
    return Intl.message(
      'Tiến triển',
      name: 'txtProgress',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết nhiệm vụ`
  String get txtDetailTask {
    return Intl.message(
      'Chi tiết nhiệm vụ',
      name: 'txtDetailTask',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết nhiệm vụ phụ`
  String get txtDetailSubTask {
    return Intl.message(
      'Chi tiết nhiệm vụ phụ',
      name: 'txtDetailSubTask',
      desc: '',
      args: [],
    );
  }

  /// `Nhiệm vụ phụ`
  String get txtSubTasks {
    return Intl.message(
      'Nhiệm vụ phụ',
      name: 'txtSubTasks',
      desc: '',
      args: [],
    );
  }

  /// `Người thực hiện`
  String get txtExecutor {
    return Intl.message(
      'Người thực hiện',
      name: 'txtExecutor',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt`
  String get txtSetting {
    return Intl.message(
      'Cài đặt',
      name: 'txtSetting',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt ứng dụng`
  String get txtAppSetting {
    return Intl.message(
      'Cài đặt ứng dụng',
      name: 'txtAppSetting',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu hiện tại của bạn trước`
  String get txtTitleChangePass1 {
    return Intl.message(
      'Vui lòng nhập mật khẩu hiện tại của bạn trước',
      name: 'txtTitleChangePass1',
      desc: '',
      args: [],
    );
  }

  /// `Bây giờ, hãy tạo mật khẩu mới của bạn`
  String get txtTitleChangePass2 {
    return Intl.message(
      'Bây giờ, hãy tạo mật khẩu mới của bạn',
      name: 'txtTitleChangePass2',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu phải chứa a-z, A-Z, 0-9`
  String get txtTitleChangePass3 {
    return Intl.message(
      'Mật khẩu phải chứa a-z, A-Z, 0-9',
      name: 'txtTitleChangePass3',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu cũ`
  String get txtCurrentPass {
    return Intl.message(
      'Mật khẩu cũ',
      name: 'txtCurrentPass',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu mới`
  String get txtNewPass {
    return Intl.message(
      'Mật khẩu mới',
      name: 'txtNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu`
  String get txtRetypePass {
    return Intl.message(
      'Nhập lại mật khẩu',
      name: 'txtRetypePass',
      desc: '',
      args: [],
    );
  }

  /// `Gửi mật khẩu mới`
  String get txtSubmitPass {
    return Intl.message(
      'Gửi mật khẩu mới',
      name: 'txtSubmitPass',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có chắc chắn muốn đăng xuất khỏi ứng dụng không?`
  String get txtTitleLogout {
    return Intl.message(
      'Bạn có chắc chắn muốn đăng xuất khỏi ứng dụng không?',
      name: 'txtTitleLogout',
      desc: '',
      args: [],
    );
  }

  /// `Nhiệm vụ của tôi`
  String get txtMyAssignment {
    return Intl.message(
      'Nhiệm vụ của tôi',
      name: 'txtMyAssignment',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận nhiệm vụ`
  String get txtConfirmTask {
    return Intl.message(
      'Xác nhận nhiệm vụ',
      name: 'txtConfirmTask',
      desc: '',
      args: [],
    );
  }

  /// `Xoá nhiệm vụ thành công`
  String get txtDeleteTask {
    return Intl.message(
      'Xoá nhiệm vụ thành công',
      name: 'txtDeleteTask',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa nhiệm  vụ`
  String get txtEditTask {
    return Intl.message(
      'Chỉnh sửa nhiệm  vụ',
      name: 'txtEditTask',
      desc: '',
      args: [],
    );
  }

  /// `Lưu`
  String get btnSave {
    return Intl.message(
      'Lưu',
      name: 'btnSave',
      desc: '',
      args: [],
    );
  }

  /// `Huỷ`
  String get btnCancel {
    return Intl.message(
      'Huỷ',
      name: 'btnCancel',
      desc: '',
      args: [],
    );
  }

  /// `Tạo tài khoản`
  String get btnRegister {
    return Intl.message(
      'Tạo tài khoản',
      name: 'btnRegister',
      desc: '',
      args: [],
    );
  }

  /// `Mô tả cho nhiệm vụ phụ`
  String get txhintDescription {
    return Intl.message(
      'Mô tả cho nhiệm vụ phụ',
      name: 'txhintDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật thông tin thành công`
  String get txtSnackbarUpdate {
    return Intl.message(
      'Cập nhật thông tin thành công',
      name: 'txtSnackbarUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa Sub-task thành công`
  String get txtSnackbarUpdateSubTask {
    return Intl.message(
      'Chỉnh sửa Sub-task thành công',
      name: 'txtSnackbarUpdateSubTask',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu thành công`
  String get txtSnackbarChangePass {
    return Intl.message(
      'Đổi mật khẩu thành công',
      name: 'txtSnackbarChangePass',
      desc: '',
      args: [],
    );
  }

  /// `Thêm Sub-Task thành công`
  String get txtSnackbarAddSubbtask {
    return Intl.message(
      'Thêm Sub-Task thành công',
      name: 'txtSnackbarAddSubbtask',
      desc: '',
      args: [],
    );
  }

  /// `Đã xảy ra lỗi`
  String get txtSnackbarError {
    return Intl.message(
      'Đã xảy ra lỗi',
      name: 'txtSnackbarError',
      desc: '',
      args: [],
    );
  }

  /// `Không có tin nhắn`
  String get txtNoMessage {
    return Intl.message(
      'Không có tin nhắn',
      name: 'txtNoMessage',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get btnDone {
    return Intl.message(
      'Hoàn thành',
      name: 'btnDone',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get btnLogin {
    return Intl.message(
      'Đăng nhập',
      name: 'btnLogin',
      desc: '',
      args: [],
    );
  }

  /// `Gửi mã`
  String get btnSendCode {
    return Intl.message(
      'Gửi mã',
      name: 'btnSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Thêm nhiệm vụ`
  String get btnAddTask {
    return Intl.message(
      'Thêm nhiệm vụ',
      name: 'btnAddTask',
      desc: '',
      args: [],
    );
  }

  /// `Thêm`
  String get btnAdd {
    return Intl.message(
      'Thêm',
      name: 'btnAdd',
      desc: '',
      args: [],
    );
  }

  /// `Phê duyệt nhiệm vụ`
  String get btnApproval {
    return Intl.message(
      'Phê duyệt nhiệm vụ',
      name: 'btnApproval',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại`
  String get btnSendAgain {
    return Intl.message(
      'Gửi lại',
      name: 'btnSendAgain',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa thông tin`
  String get btnEditProfile {
    return Intl.message(
      'Chỉnh sửa thông tin',
      name: 'btnEditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu`
  String get btnChangePass {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'btnChangePass',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get btnNotification {
    return Intl.message(
      'Thông báo',
      name: 'btnNotification',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get btnLogout {
    return Intl.message(
      'Đăng xuất',
      name: 'btnLogout',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ảnh`
  String get btnChangeImage {
    return Intl.message(
      'Chọn ảnh',
      name: 'btnChangeImage',
      desc: '',
      args: [],
    );
  }

  /// `Lưu thay đổi`
  String get btnSaveChange {
    return Intl.message(
      'Lưu thay đổi',
      name: 'btnSaveChange',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo email`
  String get btnEmailNotification {
    return Intl.message(
      'Thông báo email',
      name: 'btnEmailNotification',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo đẩy`
  String get btnPushNotification {
    return Intl.message(
      'Thông báo đẩy',
      name: 'btnPushNotification',
      desc: '',
      args: [],
    );
  }

  /// `Có`
  String get btnYes {
    return Intl.message(
      'Có',
      name: 'btnYes',
      desc: '',
      args: [],
    );
  }

  /// `Không`
  String get btnNo {
    return Intl.message(
      'Không',
      name: 'btnNo',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết`
  String get btnDetail {
    return Intl.message(
      'Chi tiết',
      name: 'btnDetail',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa`
  String get btnEdit {
    return Intl.message(
      'Chỉnh sửa',
      name: 'btnEdit',
      desc: '',
      args: [],
    );
  }

  /// `Xoá`
  String get btnDeleted {
    return Intl.message(
      'Xoá',
      name: 'btnDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Xoá nhiệm vụ phụ thành công`
  String get btnSnackDelete {
    return Intl.message(
      'Xoá nhiệm vụ phụ thành công',
      name: 'btnSnackDelete',
      desc: '',
      args: [],
    );
  }

  /// `Đang chờ phản hồi`
  String get btnWaitResponse {
    return Intl.message(
      'Đang chờ phản hồi',
      name: 'btnWaitResponse',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

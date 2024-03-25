import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'tm_localizations_en.dart';
import 'tm_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/tm_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @txtOnboarding1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Task Manager. Create projects, assign tasks, and collaborate effortlessly.'**
  String get txtOnboarding1;

  /// No description provided for @txtOnboarding2.
  ///
  /// In en, this message translates to:
  /// **'Master task management. Categorize, set deadlines, and boost team efficiency.'**
  String get txtOnboarding2;

  /// No description provided for @txtOnboarding3.
  ///
  /// In en, this message translates to:
  /// **'Track progress effortlessly. Monitor tasks, and propel your team to new heights.'**
  String get txtOnboarding3;

  /// No description provided for @txtBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get txtBack;

  /// No description provided for @txtNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get txtNext;

  /// No description provided for @txtRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get txtRegister;

  /// No description provided for @txtTitleRegister.
  ///
  /// In en, this message translates to:
  /// **'And start taking notes'**
  String get txtTitleRegister;

  /// No description provided for @txtFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get txtFullName;

  /// No description provided for @txtHintName.
  ///
  /// In en, this message translates to:
  /// **'Example: John Doe'**
  String get txtHintName;

  /// No description provided for @txtEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Adress'**
  String get txtEmail;

  /// No description provided for @txtHintEmail.
  ///
  /// In en, this message translates to:
  /// **'Example: johndoe@gmail.com'**
  String get txtHintEmail;

  /// No description provided for @txtPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get txtPassword;

  /// No description provided for @txtHintPassword.
  ///
  /// In en, this message translates to:
  /// **'********'**
  String get txtHintPassword;

  /// No description provided for @txtRetypePassword.
  ///
  /// In en, this message translates to:
  /// **'Retype Password'**
  String get txtRetypePassword;

  /// No description provided for @txtHintRetypePassword.
  ///
  /// In en, this message translates to:
  /// **'********'**
  String get txtHintRetypePassword;

  /// No description provided for @txtLableRegister.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get txtLableRegister;

  /// No description provided for @txtLoginHere.
  ///
  /// In en, this message translates to:
  /// **'Login here'**
  String get txtLoginHere;

  /// No description provided for @btnRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get btnRegister;

  /// No description provided for @txtLetsLogin.
  ///
  /// In en, this message translates to:
  /// **'Let’s Login'**
  String get txtLetsLogin;

  /// No description provided for @txtTitleLogin.
  ///
  /// In en, this message translates to:
  /// **'And note your idea'**
  String get txtTitleLogin;

  /// No description provided for @txtForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get txtForgotPassword;

  /// No description provided for @txtLableLogin.
  ///
  /// In en, this message translates to:
  /// **'Don’t have any account '**
  String get txtLableLogin;

  /// No description provided for @txtRegisterHere.
  ///
  /// In en, this message translates to:
  /// **'Register here'**
  String get txtRegisterHere;

  /// No description provided for @txtForgotPass.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get txtForgotPass;

  /// No description provided for @txtTitleForgotPass.
  ///
  /// In en, this message translates to:
  /// **'Insert your email address to receive a code for creating a new password'**
  String get txtTitleForgotPass;

  /// No description provided for @txtTask.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get txtTask;

  /// No description provided for @txtMyTask.
  ///
  /// In en, this message translates to:
  /// **'My Task'**
  String get txtMyTask;

  /// No description provided for @txtCreateTask.
  ///
  /// In en, this message translates to:
  /// **'Create New Task'**
  String get txtCreateTask;

  /// No description provided for @txtTaskType.
  ///
  /// In en, this message translates to:
  /// **'Task type'**
  String get txtTaskType;

  /// No description provided for @txtTaskName.
  ///
  /// In en, this message translates to:
  /// **'Task name'**
  String get txtTaskName;

  /// No description provided for @txtDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get txtDescription;

  /// No description provided for @txtLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get txtLow;

  /// No description provided for @txtMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get txtMedium;

  /// No description provided for @txtHigh.
  ///
  /// In en, this message translates to:
  /// **'high'**
  String get txtHigh;

  /// No description provided for @txtAddSubTask.
  ///
  /// In en, this message translates to:
  /// **'Add Sub-Task'**
  String get txtAddSubTask;

  /// No description provided for @txtNoSubTask.
  ///
  /// In en, this message translates to:
  /// **'There are no subTasks'**
  String get txtNoSubTask;

  /// No description provided for @txtCreateSubtask.
  ///
  /// In en, this message translates to:
  /// **'Create Sub-Task'**
  String get txtCreateSubtask;

  /// No description provided for @txtChooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get txtChooseDate;

  /// No description provided for @txtStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get txtStartDate;

  /// No description provided for @txtDueDate.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get txtDueDate;

  /// No description provided for @txtAssignedUser.
  ///
  /// In en, this message translates to:
  /// **'Assigned user'**
  String get txtAssignedUser;

  /// No description provided for @txtSubTaskName.
  ///
  /// In en, this message translates to:
  /// **'Sub-Task Name'**
  String get txtSubTaskName;

  /// No description provided for @txtSearchMember.
  ///
  /// In en, this message translates to:
  /// **'Search member...'**
  String get txtSearchMember;

  /// No description provided for @txtApproval.
  ///
  /// In en, this message translates to:
  /// **'Approval'**
  String get txtApproval;

  /// No description provided for @txtConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get txtConfirmation;

  /// No description provided for @txtNewTask.
  ///
  /// In en, this message translates to:
  /// **'New Task'**
  String get txtNewTask;

  /// No description provided for @txtInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get txtInProgress;

  /// No description provided for @txtError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get txtError;

  /// No description provided for @txtCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get txtCompleted;

  /// No description provided for @txtCompletedTask.
  ///
  /// In en, this message translates to:
  /// **'Completed Task'**
  String get txtCompletedTask;

  /// No description provided for @txtNoCompleted.
  ///
  /// In en, this message translates to:
  /// **'There are no task completed'**
  String get txtNoCompleted;

  /// No description provided for @txtProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get txtProgress;

  /// No description provided for @txtDetailTask.
  ///
  /// In en, this message translates to:
  /// **'Detail Task'**
  String get txtDetailTask;

  /// No description provided for @txtDetailSubTask.
  ///
  /// In en, this message translates to:
  /// **'Detail Sub-Task'**
  String get txtDetailSubTask;

  /// No description provided for @txtSubTasks.
  ///
  /// In en, this message translates to:
  /// **'Sub-Tasks'**
  String get txtSubTasks;

  /// No description provided for @txtExecutor.
  ///
  /// In en, this message translates to:
  /// **'Executor'**
  String get txtExecutor;

  /// No description provided for @txtSetting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get txtSetting;

  /// No description provided for @txtAppSetting.
  ///
  /// In en, this message translates to:
  /// **'App Setting'**
  String get txtAppSetting;

  /// No description provided for @txtTitleChangePass1.
  ///
  /// In en, this message translates to:
  /// **'Please input your current password first'**
  String get txtTitleChangePass1;

  /// No description provided for @txtTitleChangePass2.
  ///
  /// In en, this message translates to:
  /// **'Now, create your new password'**
  String get txtTitleChangePass2;

  /// No description provided for @txtTitleChangePass3.
  ///
  /// In en, this message translates to:
  /// **'Password should contain a-z, A-Z, 0-9'**
  String get txtTitleChangePass3;

  /// No description provided for @txtCurrentPass.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get txtCurrentPass;

  /// No description provided for @txtNewPass.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get txtNewPass;

  /// No description provided for @txtRetypePass.
  ///
  /// In en, this message translates to:
  /// **'Retype Password'**
  String get txtRetypePass;

  /// No description provided for @txtSubmitPass.
  ///
  /// In en, this message translates to:
  /// **'Submit new password'**
  String get txtSubmitPass;

  /// No description provided for @txtTitleLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out from the application?'**
  String get txtTitleLogout;

  /// No description provided for @txtMyAssignment.
  ///
  /// In en, this message translates to:
  /// **'My Assignment'**
  String get txtMyAssignment;

  /// No description provided for @btnLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get btnLogin;

  /// No description provided for @btnSendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get btnSendCode;

  /// No description provided for @btnAddTask.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get btnAddTask;

  /// No description provided for @btnAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get btnAdd;

  /// No description provided for @btnApproval.
  ///
  /// In en, this message translates to:
  /// **'Approval Tasks'**
  String get btnApproval;

  /// No description provided for @btnSendAgain.
  ///
  /// In en, this message translates to:
  /// **'Send Again'**
  String get btnSendAgain;

  /// No description provided for @btnEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get btnEditProfile;

  /// No description provided for @btnChangePass.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get btnChangePass;

  /// No description provided for @btnNotification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get btnNotification;

  /// No description provided for @btnLogout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get btnLogout;

  /// No description provided for @btnChangeImage.
  ///
  /// In en, this message translates to:
  /// **'Change Image'**
  String get btnChangeImage;

  /// No description provided for @btnSaveChange.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get btnSaveChange;

  /// No description provided for @btnEmailNotification.
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get btnEmailNotification;

  /// No description provided for @btnPushNotification.
  ///
  /// In en, this message translates to:
  /// **'Push Notification'**
  String get btnPushNotification;

  /// No description provided for @btnYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get btnYes;

  /// No description provided for @btnNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get btnNo;

  /// No description provided for @btnDetail.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get btnDetail;

  /// No description provided for @btnEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get btnEdit;

  /// No description provided for @btnDeleted.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get btnDeleted;

  /// No description provided for @btnSnackDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Subtask done'**
  String get btnSnackDelete;

  /// No description provided for @btnWaitResponse.
  ///
  /// In en, this message translates to:
  /// **'waiting for response'**
  String get btnWaitResponse;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

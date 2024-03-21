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

  /// No description provided for @onboarding1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Task Manager. Create projects, assign tasks, and collaborate effortlessly.'**
  String get onboarding1;

  /// No description provided for @onboarding2.
  ///
  /// In en, this message translates to:
  /// **'Master task management. Categorize, set deadlines, and boost team efficiency.'**
  String get onboarding2;

  /// No description provided for @onboarding3.
  ///
  /// In en, this message translates to:
  /// **'Track progress effortlessly. Monitor tasks, and propel your team to new heights.'**
  String get onboarding3;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @titleRegister.
  ///
  /// In en, this message translates to:
  /// **'And start taking notes'**
  String get titleRegister;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @hintName.
  ///
  /// In en, this message translates to:
  /// **'Example: John Doe'**
  String get hintName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Adress'**
  String get email;

  /// No description provided for @hintEmail.
  ///
  /// In en, this message translates to:
  /// **'Example: johndoe@gmail.com'**
  String get hintEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @hintPassword.
  ///
  /// In en, this message translates to:
  /// **'********'**
  String get hintPassword;

  /// No description provided for @retypePassword.
  ///
  /// In en, this message translates to:
  /// **'Retype Password'**
  String get retypePassword;

  /// No description provided for @hintRetypePassword.
  ///
  /// In en, this message translates to:
  /// **'********'**
  String get hintRetypePassword;

  /// No description provided for @lableRegister.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get lableRegister;

  /// No description provided for @loginHere.
  ///
  /// In en, this message translates to:
  /// **'Login here'**
  String get loginHere;

  /// No description provided for @letsLogin.
  ///
  /// In en, this message translates to:
  /// **'Let’s Login'**
  String get letsLogin;

  /// No description provided for @titleLogin.
  ///
  /// In en, this message translates to:
  /// **'And note your idea'**
  String get titleLogin;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @lableLogin.
  ///
  /// In en, this message translates to:
  /// **'Don’t have any account '**
  String get lableLogin;

  /// No description provided for @registerHere.
  ///
  /// In en, this message translates to:
  /// **'Register here'**
  String get registerHere;

  /// No description provided for @forgotPass.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPass;

  /// No description provided for @titleForgotPass.
  ///
  /// In en, this message translates to:
  /// **'Insert your email address to receive a code for creating a new password'**
  String get titleForgotPass;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @task.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get task;

  /// No description provided for @myTask.
  ///
  /// In en, this message translates to:
  /// **'My Task'**
  String get myTask;

  /// No description provided for @createTask.
  ///
  /// In en, this message translates to:
  /// **'Create New Task'**
  String get createTask;

  /// No description provided for @taskType.
  ///
  /// In en, this message translates to:
  /// **'Task type'**
  String get taskType;

  /// No description provided for @taskName.
  ///
  /// In en, this message translates to:
  /// **'Task name'**
  String get taskName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'high'**
  String get high;

  /// No description provided for @addSubTask.
  ///
  /// In en, this message translates to:
  /// **'Add Sub-Task'**
  String get addSubTask;

  /// No description provided for @noSubTask.
  ///
  /// In en, this message translates to:
  /// **'There are no subTasks'**
  String get noSubTask;

  /// No description provided for @addTask.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get addTask;

  /// No description provided for @createSubtask.
  ///
  /// In en, this message translates to:
  /// **'Create Sub-Task'**
  String get createSubtask;

  /// No description provided for @chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get chooseDate;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get dueDate;

  /// No description provided for @assignedUser.
  ///
  /// In en, this message translates to:
  /// **'Assigned user'**
  String get assignedUser;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @subTaskName.
  ///
  /// In en, this message translates to:
  /// **'Sub-Task Name'**
  String get subTaskName;

  /// No description provided for @searchMember.
  ///
  /// In en, this message translates to:
  /// **'Search member...'**
  String get searchMember;

  /// No description provided for @approval.
  ///
  /// In en, this message translates to:
  /// **'Approval'**
  String get approval;

  /// No description provided for @sendAgain.
  ///
  /// In en, this message translates to:
  /// **'Send Again'**
  String get sendAgain;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @newTask.
  ///
  /// In en, this message translates to:
  /// **'New Task'**
  String get newTask;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @completedTask.
  ///
  /// In en, this message translates to:
  /// **'Completed Task'**
  String get completedTask;

  /// No description provided for @noCompleted.
  ///
  /// In en, this message translates to:
  /// **'There are no task completed'**
  String get noCompleted;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @detailTask.
  ///
  /// In en, this message translates to:
  /// **'Detail Task'**
  String get detailTask;

  /// No description provided for @detailSubTask.
  ///
  /// In en, this message translates to:
  /// **'Detail Sub-Task'**
  String get detailSubTask;

  /// No description provided for @subTasks.
  ///
  /// In en, this message translates to:
  /// **'Sub-Tasks'**
  String get subTasks;

  /// No description provided for @executor.
  ///
  /// In en, this message translates to:
  /// **'Executor'**
  String get executor;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @appSetting.
  ///
  /// In en, this message translates to:
  /// **'App Setting'**
  String get appSetting;

  /// No description provided for @changePass.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePass;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @changeImage.
  ///
  /// In en, this message translates to:
  /// **'Change Image'**
  String get changeImage;

  /// No description provided for @saveChange.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChange;

  /// No description provided for @titleChangePass1.
  ///
  /// In en, this message translates to:
  /// **'Please input your current password first'**
  String get titleChangePass1;

  /// No description provided for @titleChangePass2.
  ///
  /// In en, this message translates to:
  /// **'Now, create your new password'**
  String get titleChangePass2;

  /// No description provided for @titleChangePass3.
  ///
  /// In en, this message translates to:
  /// **'Password should contain a-z, A-Z, 0-9'**
  String get titleChangePass3;

  /// No description provided for @currentPass.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPass;

  /// No description provided for @newPass.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPass;

  /// No description provided for @retypePass.
  ///
  /// In en, this message translates to:
  /// **'Retype Password'**
  String get retypePass;

  /// No description provided for @submitPass.
  ///
  /// In en, this message translates to:
  /// **'Submit new password'**
  String get submitPass;

  /// No description provided for @emailNotification.
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get emailNotification;

  /// No description provided for @pushNotification.
  ///
  /// In en, this message translates to:
  /// **'Push Notification'**
  String get pushNotification;

  /// No description provided for @titleLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out from the application?'**
  String get titleLogout;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @detail.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detail;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @deleted.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleted;

  /// No description provided for @snackDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Subtask done'**
  String get snackDelete;
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

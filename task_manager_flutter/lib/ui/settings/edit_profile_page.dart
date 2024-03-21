import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/settings/edit_profile_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_buttom_edit_profile.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      EditProfileController(
        authRepository: AuthRepository(
          authService: AuthService(),
        ),
      ),
    );
    return StreamBuilder(
      stream: controller.getUserByEmail(),
      builder: (context, snapshot) {
        controller.nameController.text =
            '${snapshot.data?.docs.first['full name']}';
        controller.emailController.text =
            '${snapshot.data?.docs.first['email address']}';
        return TMScaffold(
          backgroundColor: TMColor.onSecondary,
          appBar: TMAppbar(
            title: AppLocalizations.of(context).editProfile,
            leftIcon: Assets.icons.iconBack,
            leftPressed: () => Get.back(),
          ),
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        AssetImage(Assets.images.imgAvatarDefault.path),
                  ),
                  const SizedBox(height: 16.0),
                  TMButtomEditProfile(
                    title: AppLocalizations.of(context).changeImage,
                    mainAxisSize: MainAxisSize.min,
                  ),
                  const SizedBox(height: 24.0),
                  const Divider(color: TMColor.primaryDivider),
                  const SizedBox(height: 24.0),
                  TMTextFormField(
                    controller: controller.nameController,
                    lableText: AppLocalizations.of(context).fullName,
                    validator: FormValidator.validatorRequired,
                  ),
                  const SizedBox(height: 32.0),
                  TMTextFormField(
                    controller: controller.emailController,
                    lableText: AppLocalizations.of(context).email,
                    readOnly: true,
                    validator: FormValidator.validatorEmail,
                  ),
                  const SizedBox(height: 40.0),
                  TMElevateButton(
                    text: AppLocalizations.of(context).saveChange,
                    color: TMColor.secondary,
                    textColor: TMColor.onSecondary,
                    onPressed: () {
                      controller.updateProfile(
                        context,
                        id: snapshot.data?.docs.first.id ?? '',
                      );
                    },
                    isDisable: controller.isLoading.value,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/components/text_form_field/tm_text_form_filed.dart';
import 'package:task_manager_flutter/controller/settings/edit_profile_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/provider/auth_service_provider.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_buttom_edit_profile.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_img_network.dart';
import 'package:task_manager_flutter/utils/validator.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      EditProfileController(
        authRepository: AuthRepository(
          authService: AuthServiceProvider(),
        ),
      ),
    );
    return StreamBuilder(
      stream: controller.getUserByEmail(),
      builder: (context, snapshot) {
        final AppUserModel appUser =
            AppUserModel.fromFirestore(snapshot.data?.docs.first);

        controller.nameController.text = appUser.name ?? "";
        controller.emailController.text = appUser.email ?? "";

        return Obx(
          () {
            return TMScaffold(
              backgroundColor: TMColor.onSecondary,
              appBar: TMAppbar(
                title: AppLocalizations.of(context).btnEditProfile,
                leftIcon: Assets.icons.iconBack,
                leftPressed: () => Get.back(),
              ),
              body: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: (appUser.avatar?.contains('http') ?? false) &&
                                  controller.avatarPath.isEmpty
                              ? TMImageNetwork(
                                  imageUrl: appUser.avatar ?? "",
                                  demesion: 100.0,
                                )
                              : controller.avatarPath.isEmpty
                                  ? CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: AssetImage(
                                        Assets.images.imgAvatarDefault.path,
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        Image.file(
                                          File(controller.avatarPath.value),
                                          fit: BoxFit.cover,
                                        ),
                                        if (controller.isLoadAvatar.value)
                                          const Positioned.fill(
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                      ],
                                    ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TMButtomEditProfile(
                        title: AppLocalizations.of(context).btnChangeImage,
                        mainAxisSize: MainAxisSize.min,
                        onPressed: controller.pickAvatar,
                      ),
                      const SizedBox(height: 24.0),
                      const Divider(color: TMColor.primaryDivider),
                      const SizedBox(height: 24.0),
                      TMTextFormField(
                        controller: controller.nameController,
                        lableText: AppLocalizations.of(context).txtFullName,
                        validator: FormValidator.validatorRequired,
                      ),
                      const SizedBox(height: 32.0),
                      TMTextFormField(
                        controller: controller.emailController,
                        lableText: AppLocalizations.of(context).txtEmail,
                        readOnly: true,
                        validator: FormValidator.validatorEmail,
                      ),
                      const SizedBox(height: 40.0),
                      TMElevateButton(
                        text: AppLocalizations.of(context).btnSaveChange,
                        color: TMColor.secondary,
                        textColor: TMColor.onSecondary,
                        onPressed: () {
                          controller.updateProfile(
                            context,
                            id: snapshot.data?.docs.first.id,
                          );
                        },
                        isDisable: controller.isLoading.value ||
                            controller.isLoadAvatar.value,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

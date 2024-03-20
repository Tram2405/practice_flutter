import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar_search.dart';
import 'package:task_manager_flutter/components/card/tm_card_user.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_user_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/provider/user_provider.dart';
import 'package:task_manager_flutter/data/respository/user_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key, this.onPressed, this.controller});

  final Function(AppUserModel)? onPressed;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final addController = Get.put(
      AddUserController(
        userRepository: UserRepository(
          userProvider: UserProvider(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: TMColor.background,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          children: [
            TMAppbarSearch(
              leftIcon: Assets.icons.iconSearch,
              hintText: AppLocalizations.of(context).txtSearchMember,
              onChanged: addController.searchUser,
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  controller: controller,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: addController.listSearch.length,
                  itemBuilder: (_, index) {
                    AppUserModel user = addController.listSearch[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: CardUser(
                        user: user,
                        onCheck: () {
                          addController.selectedUser(user);
                          onPressed?.call(user);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

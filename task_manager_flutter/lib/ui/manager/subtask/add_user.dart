import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar_search.dart';
import 'package:task_manager_flutter/components/card/tm_card_user.dart';
import 'package:task_manager_flutter/controller/manager/subtask/add_user_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key, this.onPressed});

  final Function(AppUserModel)? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      AddUserController(),
    );
    return Scaffold(
      backgroundColor: TMColor.background,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          children: [
            TMAppbarSearch(
              leftIcon: Assets.icons.iconSearch,
              hintText: AppLocalizations.of(context).searchMember,
              onChanged: controller.searchUser,
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.listSearch.length,
                  itemBuilder: (_, index) {
                    AppUserModel user = controller.listSearch[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: CardUser(
                        user: user,
                        onCheck: () {
                          controller.selectedUser(user);
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

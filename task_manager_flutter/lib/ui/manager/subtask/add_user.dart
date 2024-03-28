import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/appbar/tm_appbar_search.dart';
import 'package:task_manager_flutter/components/card/tm_card_user.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/generated/l10n.dart'; 
import 'package:task_manager_flutter/resources/tm_color.dart';

class AddUser extends StatelessWidget {
  const AddUser(
      {super.key,
      this.onPressed,
      this.onSearch,
      this.controller,
      required this.users});

  final Function(AppUserModel)? onPressed;
  final Function(String)? onSearch;
  final ScrollController? controller;
  final List<AppUserModel> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TMColor.background,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          children: [
            TMAppbarSearch(
              leftIcon: Assets.icons.iconSearch,
              hintText: S.of(context).txtSearchMember,
              onChanged: onSearch,
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  controller: controller,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: users.length,
                  itemBuilder: (_, index) {
                    AppUserModel user = users[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: CardUser(
                        user: user,
                        onCheck: () {
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

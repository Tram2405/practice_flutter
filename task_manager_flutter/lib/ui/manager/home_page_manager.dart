import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/controller/manager/home_manager_controller.dart';

class HomePageManager extends GetView<HomeManagerController> {
  const HomePageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return TMScaffold(
      body: Center(
        child: TMElevateButton(
          text: 'Logout',
          onPressed: () {
            controller.logout();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/home_manager_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/ui/manager/approval/approval_task_page.dart';
import 'package:task_manager_flutter/ui/manager/completed/completed_page.dart';
import 'package:task_manager_flutter/ui/manager/task/task_page.dart';
import 'package:task_manager_flutter/ui/settings/setting_page.dart';

class HomePageManager extends GetView<HomeManagerController> {
  const HomePageManager({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconPaths = [
      Assets.icons.iconTask1,
      Assets.icons.iconApproval,
      Assets.icons.iconCompleted1,
      Assets.icons.iconSetting1,
    ];

    List<Widget> pages = [
      const TaskPage(),
      const ApprovalTaskPage(),
      const CompletedTaskPage(),
      const SettingPage(),
    ];
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          height: 70.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF494949).withOpacity(0.1),
                offset: const Offset(0.0, -5.0),
                blurRadius: 5.0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              iconPaths.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.selectPage(index);
                  },
                  child: SvgPicture.asset(
                    iconPaths[index],
                    width: 28.0,
                    height: 28.0,
                    color: controller.currentIndex.value == index
                        ? TMColor.onPrimary
                        : TMColor.primaryIcon,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

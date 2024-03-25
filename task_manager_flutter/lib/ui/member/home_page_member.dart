import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/member/home_member_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/ui/member/completed/completed_member_page.dart';
import 'package:task_manager_flutter/ui/member/task/task_page_member.dart';
import 'package:task_manager_flutter/ui/settings/setting_page.dart';

class HomeMemberPage extends GetView<HomeMemberController> {
  const HomeMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconPaths = [
      Assets.icons.iconTask1,
      Assets.icons.iconCompleted1,
      Assets.icons.iconSetting1,
    ];

    List<Widget> pages = [
      const TaskMemberPage(),
      const CompletedMemberPage(),
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

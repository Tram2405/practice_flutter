import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/settings/setting_controller.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMCardProfile extends StatelessWidget {
  const TMCardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController(
        authRepository: AuthRepository(authService: AuthService())));
    return StreamBuilder(
      stream: controller.getUserByEmail(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    AssetImage(Assets.images.imgAvatarDefault.path),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TMTitle(
                    title: '${snapshot.data?.docs.first['full name']}',
                    textStyle: context.textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.iconEmail,
                        width: 18.0,
                        height: 18.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        controller.emailCurrent.value,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: TMColor.primaryIcon),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey.shade400,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 25.0,
                        width: double.infinity,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 20.0,
                        width: double.infinity,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

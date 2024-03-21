import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/controller/settings/setting_controller.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/provider/auth_service_provider.dart';
import 'package:task_manager_flutter/data/respository/auth_repository.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';
import 'package:task_manager_flutter/ui/settings/widget/tm_img_network.dart';

class TMCardProfile extends StatelessWidget {
  const TMCardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      SettingController(
        authRepository: AuthRepository(
          authService: AuthServiceProvider(),
        ),
      ),
    );
    return StreamBuilder(
      stream: controller.getUserByEmail(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final AppUserModel appUser =
              AppUserModel.fromFirestore(snapshot.data?.docs.first);
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: appUser.avatar?.isEmpty ?? true
                    ? Assets.images.imgAvatarDefault.image(
                        width: 50.0,
                        height: 50.0,
                      )
                    : TMImageNetwork(imageUrl: appUser.avatar ?? ""),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TMTitle(
                    title: appUser.name ?? "",
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
            baseColor: TMColor.secondaryShimmer,
            highlightColor: TMColor.primaryHighlight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: TMColor.primaryShimmer,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    children: [
                      ColoredBox(
                        color: TMColor.primaryShimmer,
                        child: const SizedBox(
                          height: 25.0,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      ColoredBox(
                        color: TMColor.primaryShimmer,
                        child: const SizedBox(
                          height: 20.0,
                          width: double.infinity,
                        ),
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

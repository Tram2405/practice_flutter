import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/text/tm_title.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMCardProfile extends StatelessWidget {
  const TMCardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return StreamBuilder(
        stream: authService.getUserById(authService.userCurrent!.email!),
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
                          authService.userCurrent!.email ?? '',
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: TMColor.primaryIcon),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

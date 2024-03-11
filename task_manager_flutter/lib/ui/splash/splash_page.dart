import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/controller/splash/splash_controller.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.checkLoggedIn();

    return TMScaffold(
      backgroundColor: TMColor.onSecondary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.images.imgLogoApp.path,
              width: 150.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            Shimmer.fromColors(
              baseColor: TMColor.onPrimary,
              highlightColor: TMColor.primary,
              child: Text(
                'Task Manager',
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                // TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

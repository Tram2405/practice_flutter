import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/controller/manager/home_manager_controller.dart';
import 'package:task_manager_flutter/services/local/shared_prefs.dart';

class HomePageManager extends GetView<HomeManagerController> {
  const HomePageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LOgin success ${SharedPrefs.token}'),
      ),
    );
  }
}

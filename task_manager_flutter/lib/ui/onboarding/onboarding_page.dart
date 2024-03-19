import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/components/scaffold/tm_scaffold.dart';
import 'package:task_manager_flutter/controller/onboarding/onboarding_controller.dart';
import 'package:task_manager_flutter/data/model/onboarding_model.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TMScaffold(
      backgroundColor: TMColor.onBoarding,
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
          padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80.0),
              SizedBox(
                height: 240.0,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (pageViewIndex) {
                    controller.changePage(pageViewIndex);
                  },
                  children: List.generate(
                    onboardings.length,
                    (index) => Image.asset(onboardings[index].imagePath ?? '',
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Obx(
                  () => SizedBox(
                    height: 90.0,
                    child: Text(
                      onboardings[controller.currentIndex.value].text ?? '',
                      style: context.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 38.0),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardings.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.6),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: index == controller.currentIndex.value
                              ? TMColor.secondaryOnBoarding
                              : TMColor.onSecondary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 56.0),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.currentIndex.value > 0)
                      TMElevateButton(
                        onPressed: controller.onBack,
                        text: 'Back',
                        textColor: TMColor.primaryOnBoarding,
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      ),
                    const Spacer(),
                    TMElevateButton(
                      onPressed: controller.onNext,
                      text: 'Next',
                      textColor: TMColor.primaryOnBoarding,
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/data/model/onboarding_model.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';
import 'package:task_manager_flutter/l10n/tm_localizations.dart';
import 'package:task_manager_flutter/routes/app_page.dart';
import 'package:task_manager_flutter/services/local/shared_prefs.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  List<OnboardingModel> onboardings(BuildContext context) {
    return [
      OnboardingModel()
        ..imagePath = Assets.images.imgOnboardingIdea.path
        ..text = AppLocalizations.of(context).txtOnboarding1,
      OnboardingModel()
        ..imagePath = Assets.images.imgOnboardingMail.path
        ..text = AppLocalizations.of(context).txtOnboarding2,
      OnboardingModel()
        ..imagePath = Assets.images.imgOnboardingIdea.path
        ..text = AppLocalizations.of(context).txtOnboarding3,
    ];
  }

  void changePage(int pageViewIndex) {
    currentIndex.value = pageViewIndex;
  }

  void onBack() {
    currentIndex.value--;
    pageController.jumpToPage(currentIndex.value);
  }

  void onNext(BuildContext context) {
    if (currentIndex.value < onboardings(context).length - 1) {
      currentIndex.value++;
      pageController.jumpToPage(currentIndex.value);
    } else {
      SharedPrefs.isAccessed = true;
      Get.offAllNamed(Routes.REGISTER);
    }
  }
}

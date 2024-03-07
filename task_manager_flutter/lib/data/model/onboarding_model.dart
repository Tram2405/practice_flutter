import 'package:task_manager_flutter/gen/assets.gen.dart';

class OnboardingModel {
  String? imagePath;
  String? text;
}

final onboardings = [
  OnboardingModel()
    ..imagePath = Assets.images.imgOnboardingIdea.path
    ..text = "Welcome to Task Manager. Create projects, assign tasks, and collaborate effortlessly.",
  OnboardingModel()
    ..imagePath = Assets.images.imgOnboardingMail.path
    ..text = "Master task management. Categorize, set deadlines, and boost team efficiency.",
  OnboardingModel()
    ..imagePath = Assets.images.imgOnboardingIdea.path
    ..text = "Track progress effortlessly. Celebrate milestones, monitor tasks, and propel your team to new heights.",
];

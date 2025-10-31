import 'package:get/get.dart';

import '../modules/confirm_task/bindings/confirm_task_binding.dart';
import '../modules/confirm_task/views/confirm_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/new_task/bindings/new_task_binding.dart';
import '../modules/new_task/views/new_task_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => const TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.NEW_TASK,
      page: () => const NewTaskView(),
      binding: NewTaskBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_TASK,
      page: () => const ConfirmTaskView(),
      binding: ConfirmTaskBinding(),
    ),
  ];
}

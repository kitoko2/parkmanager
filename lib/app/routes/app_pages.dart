import 'package:get/get.dart';

import '../modules/addparkingplace/bindings/addparkingplace_binding.dart';
import '../modules/addparkingplace/views/addparkingplace_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/home_admin/bindings/home_binding.dart';
import '../modules/home_admin/views/home_admin_view.dart';
import '../modules/homepage_admin/bindings/homepage_binding.dart';
import '../modules/homepage_admin/views/homepage_view.dart';
import '../modules/homepublic/bindings/homepublic_binding.dart';
import '../modules/homepublic/views/homepublic_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeAdminView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageAdminView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ADDPARKINGPLACE,
      page: () => const AddparkingplaceView(),
      binding: AddparkingplaceBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPUBLIC,
      page: () => const HomepublicView(),
      binding: HomepublicBinding(),
    ),
  ];
}

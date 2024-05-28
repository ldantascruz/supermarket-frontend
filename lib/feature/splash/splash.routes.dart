import 'package:get/get_navigation/src/routes/get_route.dart';

import 'presentation/page/splash.page.dart';
import 'splash.binding.dart';

class SplashRoutes {
  static const String splash = '/splash';

  static final routes = [
    GetPage(
      name: SplashRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}

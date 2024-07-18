import 'package:get/get_navigation/src/routes/get_route.dart';

import 'home.binding.dart';
import 'presentation/page/home.page.dart';


class HomeRoutes {
  static const String home = '/home';

  static final routes = [
    GetPage(
      name: HomeRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

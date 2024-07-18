import 'package:get/get_navigation/src/routes/get_route.dart';

import 'authentication.binding.dart';
import 'presentation/page/authentication.page.dart';

class AuthenticationRoutes {
  static const String authentication = '/authentication';

  static final routes = [
    GetPage(
      name: AuthenticationRoutes.authentication,
      page: () => const AuthenticationPage(),
      binding: AuthenticationBinding(),
    ),
  ];
}

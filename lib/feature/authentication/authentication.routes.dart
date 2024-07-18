import 'package:get/get_navigation/src/routes/get_route.dart';

import 'authentication.binding.dart';
import 'presentation/page/authentication.page.dart';
import 'presentation/page/login.page.dart';
import 'presentation/page/register.page.dart';

class AuthenticationRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String authentication = '/authentication';

  static final routes = [
    GetPage(
      name: AuthenticationRoutes.login,
      page: () => const LoginPage(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AuthenticationRoutes.register,
      page: () => const RegisterPage(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AuthenticationRoutes.authentication,
      page: () => const AuthenticationPage(),
      binding: AuthenticationBinding(),
    ),
  ];
}

import '../../../feature/authentication/authentication.routes.dart';
import '../../../feature/splash/splash.routes.dart';

abstract class AppRoutes {

  static final routes = [
    ...SplashRoutes.routes,
    ...AuthenticationRoutes.routes,
  ];
}
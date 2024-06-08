import '../../../../entity/authentication.dart';
import '../../../../entity/user.dart';

abstract class AuthenticationRepository {
  Future<User> doLogin({required Authentication authentication});
  Future<User> doRegister({required User newUser});
}
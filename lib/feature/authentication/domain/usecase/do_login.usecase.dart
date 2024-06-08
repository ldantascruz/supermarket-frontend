import '../../../../entity/authentication.dart';
import '../../../../entity/user.dart';
import '../repository/authentication.repository.dart';

class DoLoginUsecase {
  final AuthenticationRepository repository;

  DoLoginUsecase(this.repository);

  Future<User> call({required Authentication authentication}) async {
    try {
      return await repository.doLogin(authentication: authentication);
    } catch (e) {
      rethrow;
    }
  }
}

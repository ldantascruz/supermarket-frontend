import '../../../../entity/user.dart';
import '../repository/authentication.repository.dart';

class DoRegisterUsecase {
  final AuthenticationRepository repository;

  DoRegisterUsecase(this.repository);

  Future<User> call({required User newUser}) async {
    try {
      return await repository.doRegister(newUser: newUser);
    } catch (e) {
      rethrow;
    }
  }
}

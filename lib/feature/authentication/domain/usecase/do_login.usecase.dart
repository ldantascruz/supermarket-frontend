import '../repository/authentication.repository.dart';

class DoLoginUsecase {
  final AuthenticationRepository repository;

  DoLoginUsecase(this.repository);

  Future<String> call({required String email, required String password}) async {
    try {
      return await repository.doLogin(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}

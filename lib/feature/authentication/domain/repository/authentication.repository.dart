abstract class AuthenticationRepository {
  Future<String> doLogin({required String email, required String password});
}
abstract class AuthenticationDatasource {
  Future<String> doLogin({required String email, required String password});
}
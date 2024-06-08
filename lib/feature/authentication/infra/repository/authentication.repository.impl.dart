import '../../domain/repository/authentication.repository.dart';
import '../datasource/authentication.datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepositoryImpl(this.datasource);

  @override
  Future<String> doLogin({required String email, required String password}) async {
    try {
      return await datasource.doLogin(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
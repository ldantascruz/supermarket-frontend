import '../../../../entity/authentication.dart';
import '../../../../entity/user.dart';
import '../../domain/repository/authentication.repository.dart';
import '../datasource/authentication.datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepositoryImpl(this.datasource);

  @override
  Future<User> doLogin({required Authentication authentication}) async {
    try {
      return await datasource.doLogin(authentication: authentication);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> doRegister({required User newUser}) async {
    try {
      return await datasource.doRegister(newUser: newUser);
    } catch (e) {
      rethrow;
    }
  }
}
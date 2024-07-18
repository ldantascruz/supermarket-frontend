import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../entity/authentication.dart';
import '../repository/authentication.repository.dart';

class AuthenticateUsecase {
  final AuthenticationRepository repository;

  AuthenticateUsecase(this.repository);

  Future<User?> call({required Authentication authentication, bool? isRegister}) async {
    try {
      return await repository.authenticate(authentication: authentication, isRegister: isRegister);
    } catch (e) {
      rethrow;
    }
  }
}

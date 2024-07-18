import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../entity/authentication.dart';
import '../repository/authentication.repository.dart';

class DoRegisterUsecase {
  final AuthenticationRepository repository;

  DoRegisterUsecase(this.repository);

  Future<User?> call(Authentication authentication) async {
    try {
      return await repository.doRegister(authentication: authentication);
    } catch (e) {
      rethrow;
    }
  }
}

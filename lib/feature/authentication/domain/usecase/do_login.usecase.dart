import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../entity/authentication.dart';
import '../repository/authentication.repository.dart';

class DoLoginUsecase {
  final AuthenticationRepository repository;

  DoLoginUsecase(this.repository);

  Future<User?> call(Authentication authentication) async {
    try {
      return await repository.doLogin(authentication: authentication);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../entity/authentication.dart';

abstract class AuthenticationRepository {
  Future<User?> doLogin({required Authentication authentication});
  Future<User?> doRegister({required Authentication authentication});
}
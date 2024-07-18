import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../entity/authentication.dart';

abstract class AuthenticationRepository {
  Future<User?> authenticate({required Authentication authentication, bool? isRegister});
}
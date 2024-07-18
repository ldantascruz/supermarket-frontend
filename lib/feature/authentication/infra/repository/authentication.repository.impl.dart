import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../entity/authentication.dart';
import '../../domain/repository/authentication.repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<User?> authenticate({required Authentication authentication, bool? isRegister}) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      rethrow;
    }
  }
}
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../entity/authentication.dart';
import '../../domain/repository/authentication.repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<User?> doLogin({required Authentication authentication}) async {
    try {
      final AuthResponse authResponse = await supabase.auth.signInWithPassword(
        email: authentication.email,
        password: authentication.password,
      );
      final Session? session = authResponse.session;
      final User? user = authResponse.user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> doRegister({required Authentication authentication}) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      rethrow;
    }
  }
}
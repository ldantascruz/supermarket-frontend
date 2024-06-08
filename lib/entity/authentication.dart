export 'extension/authentication.extension.dart';

import 'package:equatable/equatable.dart';

class Authentication extends Equatable {
  final String email;
  final String password;

  const Authentication({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
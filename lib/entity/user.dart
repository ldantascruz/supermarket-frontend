import 'package:equatable/equatable.dart';

export 'extension/user.extension.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? passwordHash;
  final String? token;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.passwordHash,
    this.token,
  });

  @override
  List<Object?> get props => [id, email, name, passwordHash];
}

import 'package:equatable/equatable.dart';

class Authentication extends Equatable {
  final String email;
  final String password;

  const Authentication({required this.email, required this.password});

  Authentication copyWith({
    String? email,
    String? password,
  }) {
    return Authentication(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
  
  factory Authentication.fromMap(Map<String, dynamic> map) {
    return Authentication(
      email: map['email'],
      password: map['password'],
    );
  }

  @override
  List<Object?> get props => [email, password];
}
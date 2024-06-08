class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password.isEmpty) {
      return 'A senha é obrigatória';
    }

    String? error = _getFirstError(password);
    if (error != null) {
      return error;
    }
    return null;
  }

  String? _getFirstError(String password) {
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(password)) {
      return 'A senha precisa ter ao menos uma letra minúscula';
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(password)) {
      return 'A senha precisa ter ao menos uma letra maiúscula';
    }
    if (!RegExp(r'^(?=.*\d)').hasMatch(password)) {
      return 'A senha precisa ter ao menos um número';
    }
    if (!RegExp(r'^(?=.*[@_#$&])').hasMatch(password)) {
      return 'A senha precisa ter ao menos um caractere especial, exemplo: @_#\$&';
    }
    if (!RegExp(r'^.{8,}').hasMatch(password)) {
      return 'A senha precisa ter ao menos 8 caracteres';
    }
    return null;
  }
}

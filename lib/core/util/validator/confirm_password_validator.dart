class ConfirmPasswordValidator {
  String? validate({String? password, String? confirmPassword}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'A confirmação de senha é obrigatória';
    }
    if (password != confirmPassword) {
      return 'As senhas não coincidem';
    }

    String? error = _getFirstError(confirmPassword);
    if (error != null) {
      return error;
    }
    return null;
  }

  String? _getFirstError(String confirmPassword) {
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(confirmPassword)) {
      return 'A confirmação de senha precisa ter ao menos uma letra minúscula';
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(confirmPassword)) {
      return 'A confirmação de senha precisa ter ao menos uma letra maiúscula';
    }
    if (!RegExp(r'^(?=.*\d)').hasMatch(confirmPassword)) {
      return 'A confirmação de senha precisa ter ao menos um número';
    }
    if (!RegExp(r'^(?=.*[@_#$&])').hasMatch(confirmPassword)) {
      return 'A confirmação de senha precisa ter ao menos um caractere especial, exemplo: @_#\$&';
    }
    if (!RegExp(r'^.{8,}').hasMatch(confirmPassword)) {
      return 'A confirmação de senha precisa ter ao menos 8 caracteres';
    }
    return null;
  }
}

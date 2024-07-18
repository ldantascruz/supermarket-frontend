import '../../../i18n/_i18n.dart';

class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password.isEmpty) {
      return R.strings.requiredField;
    }

    String? error = _getFirstError(password);
    if (error != null) {
      return error;
    }
    return null;
  }

  String? _getFirstError(String password) {
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(password)) {
      return R.strings.passwordLowerCase; // 'A senha precisa ter ao menos uma letra minúscula';
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(password)) {
      return R.strings.passwordUpperCase; // 'A senha precisa ter ao menos uma letra maiúscula';
    }
    if (!RegExp(r'^(?=.*\d)').hasMatch(password)) {
      return R.strings.passwordNumber; // 'A senha precisa ter ao menos um número';
    }
    if (!RegExp(r'^(?=.*[@_#$&])').hasMatch(password)) {
      return R.strings.passwordSpecialCharacter; // 'A senha precisa ter ao menos um caractere especial, exemplo: @_#\$&';
    }
    if (!RegExp(r'^.{8,}').hasMatch(password)) {
      return R.strings.passwordLength; // 'A senha precisa ter ao menos 8 caracteres';
    }
    return null;
  }
}

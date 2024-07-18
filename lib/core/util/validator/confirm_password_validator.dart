import '../../../i18n/_i18n.dart';

class ConfirmPasswordValidator {
  String? validate({String? password, String? confirmPassword}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return R.strings.requiredField;
    }
    if (password != confirmPassword) {
      return R.strings.passwordNotMatch;
    }
    return null;
  }
}

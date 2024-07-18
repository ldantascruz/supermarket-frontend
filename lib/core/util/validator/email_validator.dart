import '../../../i18n/_i18n.dart';

class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email.isEmpty) {
      return R.strings.requiredField;
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegex.hasMatch(email)) {
      return R.strings.invalidEmail;
    }

    return null;
  }
}

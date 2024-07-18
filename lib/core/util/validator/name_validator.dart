import '../../../i18n/_i18n.dart';

class NameValidator {
  String? validate({String? name}) {
    if (name == null || name.isEmpty) {
      return R.strings.requiredField;
    }
    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(name)) {
      return R.strings.invalidName;
    }
    if (!name.contains(' ')) {
      return R.strings.insertFullName;
    }
    return null;
  }
}


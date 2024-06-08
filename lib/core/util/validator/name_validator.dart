class NameValidator {
  String? validate({String? name}) {
    if (name == null || name.isEmpty) {
      return 'O nome é obrigatório';
    }
    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(name)) {
      return 'O nome deve conter apenas letras e espaços';
    }
    if (!name.contains(' ')) {
      return 'Digite o seu nome completo';
    }
    return null;
  }
}

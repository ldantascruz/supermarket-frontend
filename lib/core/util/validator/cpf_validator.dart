class CpfValidator {
  String? validate({String? cpf}) {
    if (cpf == null || cpf.isEmpty) {
      return 'O CPF é obrigatório';
    }

    cpf = cpf.replaceAll('.', '').replaceAll('-', '');
    if (cpf.length != 11) {
      return 'CPF deve ter 11 dígitos';
    }

    if (cpf.split('').toSet().length == 1) {
      return 'CPF inválido';
    }

    List<int> digits = cpf.split('').map((s) => int.parse(s)).toList();
    List<int> multiplicadores1 = [10, 9, 8, 7, 6, 5, 4, 3, 2];
    List<int> multiplicadores2 = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2];

    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += digits[i] * multiplicadores1[i];
    }
    int resto = 11 - (soma % 11);
    if (resto > 9) resto = 0;
    if (resto != digits[9]) {
      return 'CPF inválido';
    }

    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += digits[i] * multiplicadores2[i];
    }
    resto = 11 - (soma % 11);
    if (resto > 9) resto = 0;
    if (resto != digits[10]) {
      return 'CPF inválido';
    }

    return null;
  }
}

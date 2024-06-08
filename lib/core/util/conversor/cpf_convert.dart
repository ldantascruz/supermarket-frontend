class CpfConvert {
  String convert({required String cpf}) {
    if (cpf.isEmpty) {
      throw const FormatException('CPF vazio');
    }
    String newCpf = cpf.replaceAll('.', '').replaceAll('-', '');
    return newCpf;
  }
}

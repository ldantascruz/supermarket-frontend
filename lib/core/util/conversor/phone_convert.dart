class PhoneConvert {
  String convert({required String phone}) {
    if (phone.isEmpty) {
      throw const FormatException('Telefone vazio');
    }

    String newPhone = phone
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '')
        .replaceAll('-', '');
    return newPhone;
  }
}

class DateToIsoConvert {
  String convert({required String date}) {
    List<String> parts = date.split('/');

    if (date.isEmpty) {
      throw const FormatException('Data vazia');
    }

    if (parts.length != 3) {
      throw const FormatException('Data no formato inválido');
    }

    return '${parts[2]}-${parts[1]}-${parts[0]}';
  }
}

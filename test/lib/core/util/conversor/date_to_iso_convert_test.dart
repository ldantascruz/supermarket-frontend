import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/conversor/date_to_iso_convert.dart';

void main() {
  late DateToIsoConvert dateToIsoConvert;

  setUp(() => dateToIsoConvert = DateToIsoConvert());

  group('Conversão da Data de Nascimento', () {
    test('Retorna a data no formato ISO 24/12/1998', () {
      final result = dateToIsoConvert.convert(date: '24/12/1998');
      expect(result, '1998-12-24');
    });

    test('Retorna a data no formato ISO 01/03/2005', () {
      final result = dateToIsoConvert.convert(date: '01/03/2005');
      expect(result, '2005-03-01');
    });

    test('Retorna a data no formato ISO 28/02/2024', () {
      final result = dateToIsoConvert.convert(date: '28/02/2024');
      expect(result, '2024-02-28');
    });
  });
}

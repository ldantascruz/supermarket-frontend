import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/conversor/cpf_convert.dart';

void main() {
  late CpfConvert cpfConvert;

  setUp(() => cpfConvert = CpfConvert());

  group('Conversão do CPF ', () {
    test('Retorna o valor convertido, sem pontos e hífen 157.579.117-00', () {
      final result = cpfConvert.convert(cpf: '157.579.117-00');

      expect(result, '15757911700');
    });

    test('Retorna o valor convertido, sem pontos e hífen 123.456.789-00', () {
      final result = cpfConvert.convert(cpf: '123.456.789-00');

      expect(result, '12345678900');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/conversor/phone_convert.dart';

void main() {
  late PhoneConvert phoneConvert;

  setUp(() => phoneConvert = PhoneConvert());

  group('Conversão do Telefone', () {
    test(
      'Retorna o valor convertido, sem pontos e hífen e parênteses (27)9 9999-8823',
      () {
        final result = phoneConvert.convert(phone: '(27)9 9999-8823');
        expect(result, '27999998823');
      },
    );

    test(
      'Retorna o valor convertido, sem pontos e hífen e parênteses (81)9 8876-1254',
      () {
        final result = phoneConvert.convert(phone: '(81)9 8876-1254');
        expect(result, '81988761254');
      },
    );
  });
}

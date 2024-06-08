import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/validator/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() => emailValidator = EmailValidator());

  group('Validação do e-mail', () {
    test('Retornar uma mensagem de erro caso o e-mail seja nulo', () {
      final result = emailValidator.validate();

      expect(result, equals('O e-mail é obrigatório'));
    });

    test('Retornar uma mensagem de erro caso o e-mail seja vazio', () {
      final result = emailValidator.validate(email: '');

      expect(result, equals('O e-mail é obrigatório'));
    });

    test('Retornar uma mensagem de erro caso o e-mail seja inválido', () {
      final result = emailValidator.validate(email: 'lucas @gmail');

      expect(result, equals('O e-mail é inválido'));
    });

    test('Retornar nulo caso o e-mail seja válido', () {
      final result = emailValidator.validate(email: 'ldantascruz@gmail.com');

      expect(result, isNull);
    });
  });
}

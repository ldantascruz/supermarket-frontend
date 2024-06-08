import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/validator/cpf_validator.dart';

void main() {
  late CpfValidator cpfValidator;

  setUp(() => cpfValidator = CpfValidator());

  group('Validação do CPF', () {
    test('Retornar uma mensagem de erro caso o CPF seja nulo', () {
      final result = cpfValidator.validate();
      expect(result, 'O CPF é obrigatório');
    });

    test('Retornar uma mensagem de erro caso o CPF esteja vazio', () {
      final result = cpfValidator.validate(cpf: '');
      expect(result, 'O CPF é obrigatório');
    });

    test('Retornar uma mensagem de erro caso o CPF não tenha 11 dígitos', () {
      final result = cpfValidator.validate(cpf: '123.456.579');
      expect(result, 'CPF deve ter 11 dígitos');
    });

    test('Retornar uma mensagem de erro caso o CPF seja inválido', () {
      final result = cpfValidator.validate(cpf: '123.456.789-33');
      expect(result, 'CPF inválido');
    });

    test('Retornar nulo caso o CPF seja válido', () {
      final result = cpfValidator.validate(cpf: '157.579.117-00');
      expect(result, isNull);
    });
  });
}

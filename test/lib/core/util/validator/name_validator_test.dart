import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/validator/name_validator.dart';

void main() {
  late NameValidator nameValidator;

  setUp(() => nameValidator = NameValidator());

  group('Validação do nome', () {
    test('Retornar uma mensagem de erro caso o nome seja nulo', () {
      final result = nameValidator.validate();
      expect(result, 'O nome é obrigatório');
    });

    test('Retornar uma mensagem de erro caso o nome esteja vazio', () {
      final result = nameValidator.validate(name: '');
      expect(result, 'O nome é obrigatório');
    });

    test('Retornar uma mensagem de erro caso o nome seja inválido', () {
      final result = nameValidator.validate(name: 'T@manta Cruz');
      expect(result, 'O nome deve conter apenas letras e espaços');
    });

    test('Retornar uma mensagem de erro caso o nome seja inválido', () {
      final result = nameValidator.validate(name: 'Lucas');
      expect(result, 'Digite o seu nome completo');
    });

    test('Retornar nulo caso o nome seja válido', () {
      final result = nameValidator.validate(name: 'Lucas Dantas da Cruz');
      expect(result, isNull);
    });
  });
}

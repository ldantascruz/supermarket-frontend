import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/validator/password_validator.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() => passwordValidator = PasswordValidator());

  group('Validação da senha', () {
    test('Retornar uma mensagem de erro caso a senha seja nula', () {
      final result = passwordValidator.validate();
      expect(result, 'A senha é obrigatória');
    });

    test('Retornar uma mensagem de erro caso a senha esteja vazia', () {
      final result = passwordValidator.validate(password: '');
      expect(result, 'A senha é obrigatória');
    });

    test(
      'Retornar uma mensagem de erro caso a senha não tenha ao menos uma letra minúscula',
      () {
        final result = passwordValidator.validate(password: 'LWR&@12#');
        expect(result, 'A senha precisa ter ao menos uma letra minúscula');
      },
    );

    test(
      'Retornar uma mensagem de erro caso a senha não tenha ao menos uma letra maiúscula',
      () {
        final result = passwordValidator.validate(password: 'lwr&@12#');
        expect(result, 'A senha precisa ter ao menos uma letra maiúscula');
      },
    );

    test(
      'Retornar uma mensagem de erro caso a senha não tenha ao menos um número',
      () {
        final result = passwordValidator.validate(password: 'lwr&@LW#');
        expect(result, 'A senha precisa ter ao menos um número');
      },
    );

    test(
      'Retornar uma mensagem de erro caso a senha não tenha ao menos um caractere especial',
      () {
        final result = passwordValidator.validate(password: 'lwr12HLW');
        expect(
          result,
          'A senha precisa ter ao menos um caractere especial, exemplo: @_#\$&',
        );
      },
    );

    test(
      'Retornar uma mensagem de erro caso a senha não tenha ao menos 8 caracteres',
      () {
        final result = passwordValidator.validate(password: 'lw#12H');
        expect(result, 'A senha precisa ter ao menos 8 caracteres');
      },
    );

    test(
      'Retornar nulo caso a senha cumpra todos os requisitos.',
      () {
        final result = passwordValidator.validate(password: 'Vil@Apps2024');
        expect(result, isNull);
      },
    );
  });
}

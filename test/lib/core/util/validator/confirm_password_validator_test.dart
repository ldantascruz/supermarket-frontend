import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_flutter/core/util/validator/confirm_password_validator.dart';

void main() {
  late ConfirmPasswordValidator confirmPasswordValidator;

  setUp(() => confirmPasswordValidator = ConfirmPasswordValidator());

  group('Validação da confirmação da senha', () {
    test(
      'Retorna uma mensagem de erro caso a senha e a confirmação sejam nulas',
      () {
        final result = confirmPasswordValidator.validate();

        expect(result, equals('A confirmação de senha é obrigatória'));
      },
    );

    test(
      'Retorna uma mensagem de erro caso a senha esteja preenchida, mas a confirmação seja nula',
      () {
        final result =
            confirmPasswordValidator.validate(password: 'Vil@apps2024');

        expect(result, equals('A confirmação de senha é obrigatória'));
      },
    );

    test(
      'Retorna uma mensagem de erro caso a confirmação esteja vazia',
      () {
        final result = confirmPasswordValidator.validate(confirmPassword: '');

        expect(result, equals('A confirmação de senha é obrigatória'));
      },
    );

    test(
      'Retorna uma mensagem de erro caso a senha esteja preenchida, mas a confirmação esteja vazia',
      () {
        final result = confirmPasswordValidator.validate(
            password: 'Vil@apps2024', confirmPassword: '');

        expect(result, equals('A confirmação de senha é obrigatória'));
      },
    );

    test(
      'Retorna uma mensagem de erro caso as senhas não coincidam',
      () {
        final result = confirmPasswordValidator.validate(
          password: 'Vil@apps2024',
          confirmPassword: 'Vil@Apps2024',
        );

        expect(result, equals('As senhas não coincidem'));
      },
    );

    test(
      'Retornar uma mensagem de erro caso a confirmação de senha não tenha ao menos uma letra minúscula',
      () {
        final result = confirmPasswordValidator.validate(
          password: 'LWR&@12#',
          confirmPassword: 'LWR&@12#',
        );
        expect(result,
            'A confirmação de senha precisa ter ao menos uma letra minúscula');
      },
    );

    test(
      'Retornar uma mensagem de erro caso a confirmação de senha não tenha ao menos uma letra maiúscula',
      () {
        final result = confirmPasswordValidator.validate(
          password: 'lwr&@12#',
          confirmPassword: 'lwr&@12#',
        );
        expect(result,
            'A confirmação de senha precisa ter ao menos uma letra maiúscula');
      },
    );

    test(
      'Retornar uma mensagem de erro caso a confirmação de senha não tenha ao menos um número',
      () {
        final result = confirmPasswordValidator.validate(
          password: 'lwr&@LW#',
          confirmPassword: 'lwr&@LW#',
        );
        expect(result, 'A confirmação de senha precisa ter ao menos um número');
      },
    );

    test(
      'Retornar uma mensagem de erro caso a confirmação de senha não tenha ao menos um caractere especial',
      () {
        final result = confirmPasswordValidator.validate(
          password: 'lwr12HLW',
          confirmPassword: 'lwr12HLW',
        );
        expect(
          result,
          'A confirmação de senha precisa ter ao menos um caractere especial, exemplo: @_#\$&',
        );
      },
    );

    test(
      'Retornar uma mensagem de erro caso a confirmação de senha não tenha ao menos 8 caracteres',
      () {
        final result = confirmPasswordValidator.validate(
          password: 'lw#12H',
          confirmPassword: 'lw#12H',
        );
        expect(
            result, 'A confirmação de senha precisa ter ao menos 8 caracteres');
      },
    );

    test(
      'Retornar nulo caso a senha e a confirmação de senha cumpram todos os requisitos.',
      () {
        final result = confirmPasswordValidator.validate(
          password: 'Vil@apps2024',
          confirmPassword: 'Vil@apps2024',
        );
        expect(result, isNull);
      },
    );
  });
}

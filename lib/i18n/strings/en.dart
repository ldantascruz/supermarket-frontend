// ignore_for_file: annotate_overrides

import '../translations/translations.dart';

class En implements Translations {
  // Language code from this Translation
  String get languageCode => 'en';

  // General translations
  String get ok => 'OK';
  String get mySupermarket => 'My Supermarket';
  String get myMarket => 'My Market';
  String get search => 'Search';
  String get login => 'Login';
  String get register => 'Register';
  String get notRegistered => 'Not registered?';
  String get doRegister => 'Register';
  String get alreadyRegistered => 'Already registered?';
  String get doLogin => 'Login';
  String get password => 'Password';
  String get createPasswordHint => 'Create a password';
  String get passwordHint => 'Type your password here';
  String get confirmPasswordHint => 'Confirm your password';
  String get email => 'E-mail';
  String get emailHint => 'Type your e-mail here';
  String get name => 'Name';
  String get nameHint => 'Type your name here';
}

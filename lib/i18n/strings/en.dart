// ignore_for_file: annotate_overrides

import '../translations/translations.dart';

class En implements Translations {
  // Language code from this Translation
  String get languageCode => 'en';

  // General translations
  String get myMarket => 'My Market';
  String get name => 'Name';
  String get nameHint => 'Enter your name';
  String get email => 'E-mail';
  String get emailHint => 'Enter your e-mail';
  String get password => 'Password';
  String get passwordHint => 'Enter your password';
  String get createPasswordHint => 'Create a password';
  String get passwordConfirmation => 'Password Confirmation';
  String get passwordConfirmationHint => 'Enter your password again';
  String get register => 'Register';
  String get alreadyHaveAnAccount => 'Already have an account?';
  String get login => 'Login';
  String get doLogin => 'Do login';
  String get doNotHaveAnAccount => 'Do not have an account?';
  String get registerNow => 'Register now';
  String get alert => 'Alert';
  String get notImplemented => 'Not implemented';
  String get invalidUserOrPassword => 'Invalid user and/or password';
  String get notFound => 'Not Found';
  String get serverError => 'Server Error';
  String get badRequest => 'Bad Request';
  String get unexpectedError => 'Unexpected error';
  String get accessDenied => 'Access Denied';
  String get unauthorized => 'Unauthorized';
  String get ok => 'OK';
  String get cancel => 'Cancel';
  String get logout => 'Logout';
  String get logoutMessage => 'Are you sure you want to logout?';
  String get back => 'Back';
  String get next => 'Next';
  String get previous => 'Previous';
  String get save => 'Save';
  String get edit => 'Edit';
  String get delete => 'Delete';
  String get add => 'Add';
  String get requiredField => 'Required field';
  String get invalidEmail => 'Invalid e-mail';
  String get invalidPassword => 'Invalid password';
  String get passwordsDoNotMatch => 'Passwords do not match';
  String get userNotFound => 'User not found';
  String get userAlreadyExists => 'User already exists';
  String get invalidName => 'Name must contain only letters and spaces';
  String get invalidNameCaractersQuantity => 'Name must contain only letters and spaces';
  String get insertFullName => 'Enter your full name';
  String get passwordLowerCase => 'Password must have at least one lowercase letter';
  String get passwordUpperCase => 'Password must have at least one uppercase letter';
  String get passwordNumber => 'Password must have at least one number';
  String get passwordSpecialCharacter => 'Password must have at least one special character, example: @_#\$&';
  String get passwordLength => 'Password must have at least 8 characters';
  String get passwordNotMatch => 'Passwords do not match';
  String get fullName => 'Full Name';
  String get error => 'Error';
  String get home => 'Home';
  String get favorites => 'Favorites';
  String get profile => 'Profile';
  String get hello => 'Hello';
  String get registerSuccess => 'Registered successfully';
  String get success => 'Success';
  String get signUp => 'Sign Up';
}

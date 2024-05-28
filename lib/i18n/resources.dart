import 'package:flutter/widgets.dart';

import 'strings/_strings.dart';
import 'translations/translations.dart';

typedef StringChanged<T> = String Function(T value);

class R {
  static Translations strings = En();
  static List<Translations> translations = [Pt(), En(), Es()];

  static void load(Locale locale) {
    strings = translations.singleWhere((tr) {
      return tr.languageCode == locale.languageCode;
    }, orElse: () => En());
  }
}

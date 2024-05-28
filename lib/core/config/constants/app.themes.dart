import 'package:flutter/material.dart';

import 'app.colors.dart';
import 'app.fonts.dart';

abstract class AppThemes {
  AppThemes._();

  static const String light = 'light';
  static const String dark = 'dark';

  static const String defaultTheme = light;

  static const String themePreference = 'theme_preference';

  static const String themeMode = 'theme_mode';

  static const String themeModeLight = 'light';

  static const String themeModeDark = 'dark';

  static const String themeModeSystem = 'system';

  static const String themeModeBatterySaver = 'batterySaver';

  static ThemeData themeData = ThemeData(
    fontFamily: AppFonts.poppins,
    colorScheme: const ColorScheme.light(
      background: AppColors.backgroundColor,
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
  );
}

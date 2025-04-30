import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.backGroundColorLight,
    highlightColor: AppColors.primaryColorLight,
    dividerColor: AppColors.blackTextLight.withValues(alpha: 0.2),
    focusColor: AppColors.blackTextLight,
    canvasColor: AppColors.greyTextShade,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.blackTextLight,
    highlightColor: AppColors.primaryColorLight,
    dividerColor: AppColors.backGroundColorLight,
    focusColor: AppColors.backGroundColorLight,
    canvasColor: AppColors.whiteTextShade,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}

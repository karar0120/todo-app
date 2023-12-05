import 'package:flutter/material.dart';

import '../utils/values_manger.dart';
import 'color.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: ColorsManager.mainPurple,
      scaffoldBackgroundColor: ColorsManager.lightPurple,

      // app bar theme
      appBarTheme: const AppBarTheme(
        shadowColor: ColorsManager.lightGray,
        color: ColorsManager.mainPurple,
        centerTitle: true,
        elevation: AppSize.s4,
      ),
      datePickerTheme: const DatePickerThemeData(
        headerBackgroundColor: ColorsManager.mainPurple,
        //backgroundColor: ColorsManager.mainPurple,
        todayBackgroundColor: MaterialStatePropertyAll(ColorsManager.gray),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorsManager.mainPurple,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorsManager.mainPurple));
}

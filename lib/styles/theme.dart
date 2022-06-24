import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  AppTheme._();

  static const _floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: ColorsX.primary,
  );

  static const _bottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedItemColor: ColorsX.bluePurple,
    selectedLabelStyle: TextStyle(fontFamily: 'Girl'),
    unselectedLabelStyle: TextStyle(fontFamily: 'Girl'),
  );

  static const colorScheme = ColorScheme.light(
    primary: ColorsX.primary,
  );

  static final global = ThemeData.from(colorScheme: colorScheme).copyWith(
    scaffoldBackgroundColor: const Color(0xfff5f5f5),
    appBarTheme: const AppBarTheme(
      elevation: .4,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    floatingActionButtonTheme: _floatingActionButtonTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    iconTheme: const IconThemeData(
      color: ColorsX.grey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
        onSurface: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        primary: ColorsX.primary,
        onPrimary: Colors.black,
      ),
    ),
  );
}

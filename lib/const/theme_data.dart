import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? const Color(0xFF1C1C1E) : const Color(0xFFFFFFFF),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme
                ? Color.fromARGB(255, 49, 49, 52)
                : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xFF2C2C2E) : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          //context is being used for this  button color
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}

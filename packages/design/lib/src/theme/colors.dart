import 'package:flutter/material.dart';

class PColors {
  static const Color scaffoldBackground = Color(0xffF5F5F5);
  static const Color textFieldFill = Color(0xffFAFAFA);
  static const Color textFieldBorder = Color(0xFF3a3a3a);

  static const int _primary = 0xFF949494;

  static const MaterialColor primarySwatch = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFf9f9f9),
      100: Color(0xFFf2f2f2),
      200: Color(0xFFe8e8e8),
      300: Color(0xFFd8d8d8),
      400: Color(0xFFb4b4b4),
      500: Color(_primary),
      600: Color(0xFF6c6c6c),
      700: Color(0xFF595959),
      800: Color(0xFF3a3a3a),
      900: Color(0xFF1A1A1A),
    },
  );

  static const MaterialColor secondarySwatch = Colors.yellow;
}

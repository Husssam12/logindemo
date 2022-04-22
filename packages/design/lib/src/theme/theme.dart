import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'const.dart';
import 'typo.dart';

final kButtonPadding = REdgeInsets.all(LayoutConstrains.m1);
final kChipPadding = REdgeInsets.all(LayoutConstrains.s2);
final _borderWidth = 1.r;
final _inputBorderRadius = BorderRadius.circular(PRadius.texFiled).r;

final theme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: PColors.primarySwatch.shade500,
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: _colorScheme,
  textButtonTheme: _textButtonTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  chipTheme: _chipTheme,
  iconTheme: _kIconTheme,
  appBarTheme: _appBarTheme,
  inputDecorationTheme: _kInputDecoration,
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.card),
    ),
  )
);

final _kInputDecoration = InputDecorationTheme(
  iconColor: Colors.black87,
  hintStyle: const TextStyle(color: Colors.black54),
  contentPadding: REdgeInsets.symmetric(vertical: 14, horizontal: 14),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: _borderWidth, color: PColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(width: _borderWidth, color: PColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: PColors.primarySwatch.shade500),
    borderRadius: _inputBorderRadius,
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: _borderWidth, color: Colors.red),
    borderRadius: _inputBorderRadius,
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: _borderWidth, color: PColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
);

final _kIconTheme = IconThemeData(size: 20.r);

final _textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    padding: kButtonPadding,
    onSurface: Colors.black,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: kButtonPadding,
    primary: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _colorScheme = ColorScheme.fromSwatch(
  primarySwatch: PColors.primarySwatch,
  brightness: Brightness.dark,
);

final _chipTheme = ChipThemeData(
  padding: kChipPadding,
  selectedColor: PColors.primarySwatch.shade50,
  backgroundColor: Colors.transparent,
  checkmarkColor: PColors.primarySwatch.shade400,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      width: 1.r,
    ),
    borderRadius: BorderRadius.circular(PRadius.chip.r),
  ),
);

const _appBarTheme = AppBarTheme(
  color: Colors.transparent,
  elevation: 0,
  foregroundColor: Colors.white,
);

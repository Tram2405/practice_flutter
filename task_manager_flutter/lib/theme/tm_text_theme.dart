import 'package:flutter/material.dart';
import 'package:task_manager_flutter/resources/tm_text_style.dart';

class TMTextTheme {
  static TextTheme appTextTheme = TextTheme(
    displayLarge: TMTextStyle.header1TextStyle,
    displayMedium: TMTextStyle.header2TextStyle,
    displaySmall: TMTextStyle.header3TextStyle,
    labelLarge: TMTextStyle.lableLarge,
    labelSmall: TMTextStyle.textAppbar,
    titleLarge: TMTextStyle.titleLarge,
    titleMedium: TMTextStyle.titleMedium,
    bodyLarge: TMTextStyle.textLarge,
    bodyMedium: TMTextStyle.textMedium,
    bodySmall: TMTextStyle.textSmall,
  );
}

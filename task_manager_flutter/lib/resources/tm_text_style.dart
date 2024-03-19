import 'package:flutter/material.dart';
import 'package:task_manager_flutter/gen/fonts.gen.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMTextStyle {
  static TextStyle primaryTextStyle({
    required double fontSize,
    required String fontFamily,
    Color? textColor,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: textColor,
    );
  }

  static TextStyle header1TextStyle = primaryTextStyle(
      fontSize: 32.0,
      fontFamily: FontFamily.interBold,
      textColor: TMColor.onBackground);
  static TextStyle header2TextStyle = primaryTextStyle(
    fontSize: 24.0,
    fontFamily: FontFamily.interBold,
  );
  static TextStyle header3TextStyle = primaryTextStyle(
      fontSize: 20.0,
      fontFamily: FontFamily.interBold,
      textColor: TMColor.onBackground);
  static TextStyle textAppbar = primaryTextStyle(
      fontSize: 18.0,
      fontFamily: FontFamily.interSemiBold,
      textColor: TMColor.onBackground);
  static TextStyle titleLarge = primaryTextStyle(
    fontSize: 16.0,
    fontFamily: FontFamily.interRegular,
    textColor: TMColor.textField,
  );
  static TextStyle titleMedium = primaryTextStyle(
      fontSize: 16.0,
      fontFamily: FontFamily.interMedium,
      textColor: TMColor.onBackground);
  static TextStyle textLarge = primaryTextStyle(
    fontSize: 16.0,
    fontFamily: FontFamily.interBold,
  );
  static TextStyle textMedium = primaryTextStyle(
      fontSize: 14.0,
      fontFamily: FontFamily.interRegular,
      textColor: TMColor.onTask);
  static TextStyle textSmall = primaryTextStyle(
      fontSize: 13.0,
      fontFamily: FontFamily.interRegular,
      textColor: TMColor.onTask);
  static TextStyle lableLarge = primaryTextStyle(
    fontSize: 14.0,
    fontFamily: FontFamily.interBold,
  );
  static TextStyle textOnboarding = primaryTextStyle(
    fontSize: 16.0,
    fontFamily: FontFamily.interBold,
    textColor: TMColor.onSecondary,
  );
}

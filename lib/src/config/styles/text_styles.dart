import 'package:flutter/cupertino.dart';

abstract class AppTextStyles {
  static TextStyle medium({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle regular({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Roboto',
      fontSize: fontSize,
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  static const _whiteHex = 0xfffafafa;

  const ColorUtils._();

  static String colorToHex(Color color) {
    const radix = 16;
    const padWidth = 8;
    const substringStart = 2;

    final value = color.value
        .toRadixString(radix)
        .padLeft(padWidth, '0')
        .substring(substringStart);

    return '#$value'.toUpperCase();
  }

  static Color generateRandomColor() {
    return Color(Random().nextInt(_whiteHex)).withOpacity(1);
  }

  static bool isColorLight(Color color) {
    const darkLuminanceValue = 0.5;

    return color.computeLuminance() > darkLuminanceValue;
  }
}

import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppColors {
  static Map<int, Color> primarySwatchColor = {
    50: const Color.fromRGBO(239, 62, 84, .1),
    100: const Color.fromRGBO(239, 62, 84, .2),
    200: const Color.fromRGBO(239, 62, 84, .3),
    300: const Color.fromRGBO(239, 62, 84, .4),
    400: const Color.fromRGBO(239, 62, 84, .5),
    500: const Color.fromRGBO(239, 62, 84, .6),
    600: const Color.fromRGBO(239, 62, 84, .7),
    700: const Color.fromRGBO(239, 62, 84, .8),
    800: const Color.fromRGBO(239, 62, 84, .9),
    900: const Color.fromRGBO(239, 62, 84, 1),
  };
  static MaterialColor primaryColor =
      MaterialColor(0xFFef3e54, primarySwatchColor);

  static Color scopeChipColor = const Color(0xFF2ecc71);
  static Color typeChipColor = const Color(0xFF34495e);
  static Color liveChipColor = const Color(0xFF16a085);
}

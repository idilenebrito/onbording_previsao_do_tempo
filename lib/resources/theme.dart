import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightBlue,
    secondaryHeaderColor: const Color.fromARGB(239, 55, 161, 232),
    cardColor: Colors.blue.shade100,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
    secondaryHeaderColor: Colors.purple,
    cardColor: Colors.purple.shade100,
  );
}

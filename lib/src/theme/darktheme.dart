import 'package:flutter/material.dart';

final darkT = ThemeData.dark();
final myTheme =ThemeData(
  colorScheme: darkT.colorScheme.copyWith(
    secondary: Colors.red
  ),
);
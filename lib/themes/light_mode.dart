import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color.fromARGB(255, 239, 238, 241),
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade500,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.grey[800], // is the same as Colors.grey.shade800
        displayColor: Colors.black,
      ),
);

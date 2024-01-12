import 'package:flutter/material.dart';

class AppStyles {
  // Warna
  static const Color primaryColor = Color.fromARGB(255, 6, 196, 158);
  static const Color secondaryColor = Colors.green;
  static const Color textColor = Colors.black;

  // Ukuran Teks
  static const double smallFontSize = 14.0;
  static const double regularFontSize = 16.0;
  static const double largeFontSize = 18.0;

  // Jenis Teks
  static const TextStyle regularTextStyle = TextStyle(
    fontSize: regularFontSize,
    color: textColor,
  );

  static const TextStyle boldTextStyle = TextStyle(
    fontSize: largeFontSize,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle smallTextStyle = TextStyle(
    fontSize: smallFontSize,
    color: textColor,
  );
}

import 'package:flutter/material.dart';

class AppStyles {
  // Warna
  static const Color primaryColor = Color.fromRGBO(6, 196, 158, 1);
  static const Color secondaryColor = Colors.green;
  static const Color lightGray = Color.fromARGB(255, 174, 174, 174);
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

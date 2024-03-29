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
  static const double xtraLargeFontSize = 32.0;

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

  static const TextStyle headingStyle = TextStyle(
    fontSize: xtraLargeFontSize,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle smallTextStyle = TextStyle(
    fontSize: smallFontSize,
    color: textColor,
  );

  static final inputTextStyle = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 195, 195, 195),
        width: 0.8,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppStyles.primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Colors.red),
    ),
    isDense: true,
  );
}

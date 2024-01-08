import 'package:flutter/material.dart';

void goTo<T extends Widget>(BuildContext context, T page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

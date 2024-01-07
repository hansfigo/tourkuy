import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationState extends ChangeNotifier {
  int state = 0;

  void set(int index) {
    state = index;
    notifyListeners();
  }
}

final bottomNavigationProvider = ChangeNotifierProvider<BottomNavigationState>(
    (ref) => BottomNavigationState());

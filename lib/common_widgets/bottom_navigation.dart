import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/providers/bottom_navigation_provider.dart';

class MyBottomNavigation extends ConsumerWidget {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(bottomNavigationProvider).state;

    void onItemTapped(int index) {
      ref.read(bottomNavigationProvider).set(index);
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 6, 196, 158),
      onTap: onItemTapped,
    );
  }
}

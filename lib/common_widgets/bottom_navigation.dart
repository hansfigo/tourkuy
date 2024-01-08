import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/pages/home/home_page.dart';
import 'package:tourkuy/pages/profile_page/profile_page.dart';
import 'package:tourkuy/pages/search_page/search_page.dart';
import 'package:tourkuy/providers/bottom_navigation_provider.dart';
import 'package:tourkuy/utils/goto.dart';

class MyBottomNavigation extends ConsumerWidget {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(bottomNavigationProvider).state;

    void onItemTapped(int index) {
      ref.read(bottomNavigationProvider).set(index);

      switch (index) {
        case 0:
          goTo(context, const HomePage());
        case 1:
          goTo(context, const SearchPage());
        case 2:
          goTo(context, const ProfilePage());
        default:
      }
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 6, 196, 158),
      onTap: onItemTapped,
    );
  }
}

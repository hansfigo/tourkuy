import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/pages/home/home_page.dart';
import 'package:tourkuy/pages/profile_page/profile_page.dart';
import 'package:tourkuy/pages/search_page/search_page.dart';
import 'package:tourkuy/providers/bottom_navigation_provider.dart';
import 'package:tourkuy/styles/style.dart';
import 'package:tourkuy/utils/goto.dart';

class MyBottomNavigation extends ConsumerWidget {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(bottomNavigationProvider).state;

    const double iconSize = 30.0;

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

    return Container(
      decoration: BoxDecoration(
        color: AppStyles.primaryColor, // Ganti warna sesuai kebutuhan
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(32.0)), // Atur border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: iconSize),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: iconSize),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: iconSize),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 184, 184, 184),
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
        elevation: 0, // Menghilangkan shadow bawaan dari BottomNavigationBar
        backgroundColor:
            Colors.transparent, // Menghilangkan warna latar belakang bawaan
      ),
    );
  }
}

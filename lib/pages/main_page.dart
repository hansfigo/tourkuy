import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';
import 'package:tourkuy/pages/home/home_page.dart';
import 'package:tourkuy/providers/bottom_navigation_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<MainPage> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Profile',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            _widgetOptions.elementAt(ref.watch(bottomNavigationProvider).state),
        bottomNavigationBar: const MyBottomNavigation());
  }
}

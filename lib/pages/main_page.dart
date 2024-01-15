import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/pages/home/page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomePage());
    // body:
    //     _widgetOptions.elementAt(ref.watch(bottomNavigationProvider).state),
  }
}

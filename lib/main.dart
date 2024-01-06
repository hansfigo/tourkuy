import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/pages/spash_screen_page.dart';

void main() {
  runApp(ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: const SlashScreenPage()
      ),
    );
  }
}

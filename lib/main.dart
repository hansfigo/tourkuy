import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourkuy/pages/spash_screen_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourkuy/utils/firebase/firebase_options.dart';

class SelectedIndex extends ChangeNotifier {
  int state = 0;

  void set(int index) {
    state = index;
    notifyListeners();
  }
}

final selectedIndexProvider =
    ChangeNotifierProvider<SelectedIndex>((ref) => SelectedIndex());

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const Scaffold(body: SlashScreenPage()),
    );
  }
}
